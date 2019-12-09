defmodule Day7 do
  @doc """
  ## Examples
      iex> Day7.part1
      24405
  """
  def part1 do
    program = input()
    perms =
      0..4
      |> Enum.to_list()
      |> permutations

    for list <- perms do
      run_chain(program, list)
    end
    |> List.flatten()
    |> Enum.max()
  end

  def input do
    File.read!("priv/d07p1")
    |> String.trim
    |> IntCode.load_program
  end

  @doc """
  ## Examples
      iex> [3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0] |> IntCode.load_program |> Day7.run_chain([4,3,2,1,0])
      43210
      iex> [3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0] |> IntCode.load_program |> Day7.run_chain([0,1,2,3,4])
      54321
      iex> [3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33, 1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0] |> IntCode.load_program |> Day7.run_chain([1,0,4,3,2])
      65210
  """
  def run_chain(program, [a, b, c, d, e]) do
    {:ok, a_pid} = Task.start(IntCode, :run_program, [program])
    {:ok, b_pid} = Task.start(IntCode, :run_program, [program])
    {:ok, c_pid} = Task.start(IntCode, :run_program, [program])
    {:ok, d_pid} = Task.start(IntCode, :run_program, [program])
    {:ok, e_pid} = Task.start(IntCode, :run_program, [program])
    send(a_pid, {:output_pid, b_pid})
    send(a_pid, {:input, a})
    send(b_pid, {:output_pid, c_pid})
    send(b_pid, {:input, b})
    send(c_pid, {:output_pid, d_pid})
    send(c_pid, {:input, c})
    send(d_pid, {:output_pid, e_pid})
    send(d_pid, {:input, d})
    send(e_pid, {:output_pid, self()})
    send(e_pid, {:input, e})
    send(a_pid, {:input, 0})

    receive do
      {:output_val, x} -> x
    end
  end

  @doc """
  ## Examples
      iex> [3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26, 27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5] |> IntCode.load_program |> Day7.run_chain_with_feedback([9,8,7,6,5])
      139629729
      iex> [3,52,1001,52,-5,52,3,53,1,52,56,54,1007,54,5,55,1005,55,26,1001,54, -5,54,1105,1,12,1,53,54,53,1008,54,0,55,1001,55,1,55,2,53,55,53,4, 53,1001,56,-1,56,1005,56,6,99,0,0,0,0,10] |> IntCode.load_program |> Day7.run_chain_with_feedback([9,7,8,5,6])
      18216
  """
  def run_chain_with_feedback(program, [a, b, c, d, e]) do
    {:ok, a_pid} = Task.start(IntCode, :run_program, [program])
    {:ok, b_pid} = Task.start(IntCode, :run_program, [program])
    {:ok, c_pid} = Task.start(IntCode, :run_program, [program])
    {:ok, d_pid} = Task.start(IntCode, :run_program, [program])
    {:ok, e_pid} = Task.start(IntCode, :run_program, [program])
    send(a_pid, {:output_pid, b_pid})
    send(a_pid, {:input, a})
    send(b_pid, {:output_pid, c_pid})
    send(b_pid, {:input, b})
    send(c_pid, {:output_pid, d_pid})
    send(c_pid, {:input, c})
    send(d_pid, {:output_pid, e_pid})
    send(d_pid, {:input, d})
    send(e_pid, {:output_pid, self()})
    send(e_pid, {:input, e})
    send(e_pid, {:output_pid, a_pid})
    send(a_pid, {:input, 0})
    wait_for_final_answer_from(e_pid, nil)
  end

  def wait_for_final_answer_from(pid, val) do
    receive do
      {:output_val, x} ->
        if Process.alive?(pid) do
          # IO.puts("Non-final output: #{x}")
          wait_for_final_answer_from(pid, x)
        else
          x
        end
    after
      50 ->
        if Process.alive?(pid) do
          wait_for_final_answer_from(pid, val)
        else
          val
        end
    end
  end

  @doc """
  ## Examples
      iex> Day7.permutations([1])
      [[1]]
      iex> Day7.permutations([1,2])
      [[1,2], [2,1]]
  """
  def permutations([]), do: [[]]

  def permutations(list) do
    for elem <- list, rest <- permutations(list -- [elem]) do
      [elem | rest]
    end
  end

  @doc """
  ## Examples
      iex> Day7.part2
      8271623
  """
  def part2 do
    input = input()
    perms =
      5..9
      |> Enum.to_list()
      |> permutations

    for list <- perms do
      input
      |> run_chain_with_feedback(list)
    end
    |> List.flatten()
    |> Enum.max()
  end
end
