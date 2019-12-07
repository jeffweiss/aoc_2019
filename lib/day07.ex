defmodule Day7 do
  @input [
    3,
    8,
    1001,
    8,
    10,
    8,
    105,
    1,
    0,
    0,
    21,
    34,
    59,
    68,
    85,
    102,
    183,
    264,
    345,
    426,
    99999,
    3,
    9,
    101,
    3,
    9,
    9,
    102,
    3,
    9,
    9,
    4,
    9,
    99,
    3,
    9,
    1002,
    9,
    4,
    9,
    1001,
    9,
    2,
    9,
    1002,
    9,
    2,
    9,
    101,
    5,
    9,
    9,
    102,
    5,
    9,
    9,
    4,
    9,
    99,
    3,
    9,
    1001,
    9,
    4,
    9,
    4,
    9,
    99,
    3,
    9,
    101,
    3,
    9,
    9,
    1002,
    9,
    2,
    9,
    1001,
    9,
    5,
    9,
    4,
    9,
    99,
    3,
    9,
    1002,
    9,
    3,
    9,
    1001,
    9,
    5,
    9,
    102,
    3,
    9,
    9,
    4,
    9,
    99,
    3,
    9,
    1001,
    9,
    1,
    9,
    4,
    9,
    3,
    9,
    1001,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    102,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    1001,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    101,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    102,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    102,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    101,
    1,
    9,
    9,
    4,
    9,
    3,
    9,
    101,
    1,
    9,
    9,
    4,
    9,
    99,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    1001,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    101,
    1,
    9,
    9,
    4,
    9,
    3,
    9,
    1001,
    9,
    1,
    9,
    4,
    9,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    101,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    101,
    1,
    9,
    9,
    4,
    9,
    3,
    9,
    101,
    2,
    9,
    9,
    4,
    9,
    99,
    3,
    9,
    1001,
    9,
    1,
    9,
    4,
    9,
    3,
    9,
    101,
    1,
    9,
    9,
    4,
    9,
    3,
    9,
    102,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    101,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    1001,
    9,
    1,
    9,
    4,
    9,
    3,
    9,
    1001,
    9,
    1,
    9,
    4,
    9,
    3,
    9,
    102,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    1001,
    9,
    1,
    9,
    4,
    9,
    99,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    101,
    1,
    9,
    9,
    4,
    9,
    3,
    9,
    1001,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    102,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    102,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    1001,
    9,
    1,
    9,
    4,
    9,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    1001,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    101,
    2,
    9,
    9,
    4,
    9,
    99,
    3,
    9,
    1001,
    9,
    1,
    9,
    4,
    9,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    101,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    101,
    1,
    9,
    9,
    4,
    9,
    3,
    9,
    1002,
    9,
    2,
    9,
    4,
    9,
    3,
    9,
    101,
    1,
    9,
    9,
    4,
    9,
    3,
    9,
    102,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    101,
    1,
    9,
    9,
    4,
    9,
    3,
    9,
    102,
    2,
    9,
    9,
    4,
    9,
    3,
    9,
    101,
    2,
    9,
    9,
    4,
    9,
    99
  ]

  defmodule Amp do

    @doc """
    ## Examples
        iex> Day7.run([1,0,0,0,99])
        []
        iex> Day7.run([2,3,0,3,99])
        []
        iex> Day7.run([1,1,1,4,99,5,6,0,99])
        []
        iex> Day7.run([1101,100,-1,4,0])
        []
        iex> Day7.run([3,9,8,9,10,9,4,9,99,-1,8], 0, [7], [])
        [0]
        iex> Day7.run([3,9,8,9,10,9,4,9,99,-1,8], 0, [8], [])
        [1]
        iex> Day7.run([3,9,7,9,10,9,4,9,99,-1,8], 0, [7], [])
        [1]
        iex> Day7.run([3,3,1108,-1,8,3,4,3,99], 0, [8], [])
        [1]
        iex> Day7.run([3,3,1107,-1,8,3,4,3,99], 0, [8], [])
        [0]
        iex> Day7.run([3,3,1107,-1,8,3,4,3,99], 0, [8], [])
        [0]
        iex> Day7.run([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], 0, [0], [])
        [0]
        iex> Day7.run([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], 0, [8], [])
        [1]
        iex> Day7.run([3,3,1105,-1,9,1101,0,0,12,4,12,99,1], 0, [0], [])
        [0]
        iex> Day7.run([3,3,1105,-1,9,1101,0,0,12,4,12,99,1], 0, [8], [])
        [1]
        iex> Day7.run([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 0, [8], [])
        [1000]
        iex> Day7.run([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 0, [9], [])
        [1001]
        iex> Day7.run([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 0, [-7], [])
        [999]
    """
    def run(list, pc \\ 0, inputs \\ [], outputs \\ [])

    def run(list, pc, inputs, outputs) do
      remaining_instructions = Enum.drop(list, pc)

      case do_operation(remaining_instructions, list, inputs, outputs) do
        {{:pc, inc}, new_list, new_inputs, new_outputs} ->
          run(new_list, pc + inc, new_inputs, new_outputs)

        {{:jmp, ip}, new_list, new_inputs, new_outputs} ->
          run(new_list, ip, new_inputs, new_outputs)

        {:halt, _list, _inputs, outputs} ->
          outputs
      end
    end

    @doc """
    ## Examples
        iex> Day7.do_operation([1,0,0,0,99], [1,0,0,0,99], [], [])
        {{:pc, 4}, [2,0,0,0,99], [], []}
        iex> Day7.do_operation([2,3,0,3,99], [2,3,0,3,99], [], [])
        {{:pc, 4}, [2,3,0,6,99], [], []}
        iex> Day7.do_operation([99], [2,3,0,3,99], [], [])
        {:halt, [2,3,0,3,99], [], []}
        iex> Day7.do_operation([3,3], [2,3,0,3,99], [4], [])
        {{:pc, 2}, [2,3,0,4,99], [], []}
        iex> Day7.do_operation([4,3], [2,3,0,3,99], [], [])
        {{:pc, 2}, [2,3,0,3,99], [], [3]}
        iex> Day7.do_operation([5,3,1], [2,3,0,3,99], [], [])
        {{:jmp, 3}, [2,3,0,3,99], [], []}
        iex> Day7.do_operation([5,3,1], [2,3,0,3,99], [], [])
        {{:jmp, 3}, [2,3,0,3,99], [], []}

    """
    def do_operation([opcode | rest], list, inputs, outputs) when not is_list(opcode) do
      do_operation([opcode_to_digits(opcode) | rest], list, inputs, outputs)
    end

    def do_operation([[_a, b, c, 0, 1], p1, p2, p3 | _], list, inputs, outputs) do
      v1 =
        case c do
          0 -> Enum.at(list, p1)
          1 -> p1
        end

      v2 =
        case b do
          0 -> Enum.at(list, p2)
          1 -> p2
        end

      {{:pc, 4}, List.replace_at(list, p3, v1 + v2), inputs, outputs}
    end

    def do_operation([[_a, b, c, 0, 2], p1, p2, p3 | _], list, inputs, outputs) do
      v1 =
        case c do
          0 -> Enum.at(list, p1)
          1 -> p1
        end

      v2 =
        case b do
          0 -> Enum.at(list, p2)
          1 -> p2
        end

      {{:pc, 4}, List.replace_at(list, p3, v1 * v2), inputs, outputs}
    end

    def do_operation([[_a, _b, _c, 0, 3], p1 | _] = opcode, list, [], outputs) do
      receive do
        {:input, x} ->
          {{:pc, 2}, List.replace_at(list, p1, x), [], outputs}
        {:output_val, x} ->
          {{:pc, 2}, List.replace_at(list, p1, x), [], outputs}
        {:output_pid, pid} ->
          do_operation(opcode, list, [], [pid|outputs])
      end
    end

    def do_operation([[_a, _b, _c, 0, 3], p1 | _], list, [x | rest], outputs) do
      {{:pc, 2}, List.replace_at(list, p1, x), rest, outputs}
    end

    def do_operation([[_a, _b, c, 0, 4], p1 | _], list, inputs, outputs) do
      v1 =
        case c do
          0 -> Enum.at(list, p1)
          1 -> p1
        end

      for pid <- outputs, do: send(pid, {:output_val, v1})
      {{:pc, 2}, list, inputs, outputs}
    end

    def do_operation([[_a, b, c, 0, 5], p1, p2 | _], list, inputs, outputs) do
      v1 =
        case c do
          0 -> Enum.at(list, p1)
          1 -> p1
        end

      v2 =
        case b do
          0 -> Enum.at(list, p2)
          1 -> p2
        end

      case v1 do
        x when x != 0 ->
          {{:jmp, v2}, list, inputs, outputs}

        _ ->
          {{:pc, 3}, list, inputs, outputs}
      end
    end

    def do_operation([[_a, b, c, 0, 6], p1, p2 | _], list, inputs, outputs) do
      v1 =
        case c do
          0 -> Enum.at(list, p1)
          1 -> p1
        end

      v2 =
        case b do
          0 -> Enum.at(list, p2)
          1 -> p2
        end

      case v1 do
        0 ->
          {{:jmp, v2}, list, inputs, outputs}

        _ ->
          {{:pc, 3}, list, inputs, outputs}
      end
    end

    def do_operation([[_a, b, c, 0, 7], p1, p2, p3 | _], list, inputs, outputs) do
      v1 =
        case c do
          0 -> Enum.at(list, p1)
          1 -> p1
        end

      v2 =
        case b do
          0 -> Enum.at(list, p2)
          1 -> p2
        end

      replacement =
        case v1 < v2 do
          true -> 1
          _ -> 0
        end

      {{:pc, 4}, List.replace_at(list, p3, replacement), inputs, outputs}
    end

    def do_operation([[_a, b, c, 0, 8], p1, p2, p3 | _], list, inputs, outputs) do
      v1 =
        case c do
          0 -> Enum.at(list, p1)
          1 -> p1
        end

      v2 =
        case b do
          0 -> Enum.at(list, p2)
          1 -> p2
        end

      replacement =
        case v1 == v2 do
          true -> 1
          _ -> 0
        end

      {{:pc, 4}, List.replace_at(list, p3, replacement), inputs, outputs}
    end

    def do_operation([[0, 0, 0, 9, 9] | _], list, inputs, outputs) do
      {:halt, list, inputs, outputs}
    end

    @doc """
    ## Examples

        iex> Day7.opcode_to_digits(5)
        [0, 0, 0, 0, 5]
        iex> Day7.opcode_to_digits(10001)
        [1, 0, 0, 0, 1]

    """
    def opcode_to_digits(opcode) do
      opcode
      |> Integer.digits()
      |> prepend_with_zeros
    end

    def prepend_with_zeros(list) when length(list) < 5 do
      prepend_with_zeros([0 | list])
    end

    def prepend_with_zeros(list), do: list
  end

  @doc """
  ## Examples
      iex> Day7.part1
      24405
  """
  def part1 do
    perms =
      0..4
      |> Enum.to_list()
      |> permutations

    for list <- perms do
      run_chain(@input, list)
    end
    |> List.flatten()
    |> Enum.max()
  end

  @doc """
  ## Examples
      iex> Day7.run_chain([3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0], [4,3,2,1,0])
      43210
      iex> Day7.run_chain([3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0], [0,1,2,3,4])
      54321
      iex> Day7.run_chain([3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33, 1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0], [1,0,4,3,2])
      65210
  """
  def run_chain(program, [a, b, c, d, e]) do
    {:ok, a_pid} = Task.start(Amp, :run, [program, 0, [a], []])
    {:ok, b_pid} = Task.start(Amp, :run, [program, 0, [b], []])
    {:ok, c_pid} = Task.start(Amp, :run, [program, 0, [c], []])
    {:ok, d_pid} = Task.start(Amp, :run, [program, 0, [d], []])
    {:ok, e_pid} = Task.start(Amp, :run, [program, 0, [e], [self()]])
    send(a_pid, {:output_pid, b_pid})
    send(b_pid, {:output_pid, c_pid})
    send(c_pid, {:output_pid, d_pid})
    send(d_pid, {:output_pid, e_pid})
    send(a_pid, {:input, 0})
    receive do
      {:output_val, x} -> x
    end

  end

  @doc """
  ## Examples
      iex> Day7.run_chain_with_feedback([3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26, 27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5], [9,8,7,6,5])
      139629729
      iex> Day7.run_chain_with_feedback([3,52,1001,52,-5,52,3,53,1,52,56,54,1007,54,5,55,1005,55,26,1001,54, -5,54,1105,1,12,1,53,54,53,1008,54,0,55,1001,55,1,55,2,53,55,53,4, 53,1001,56,-1,56,1005,56,6,99,0,0,0,0,10], [9,7,8,5,6])
      18216
  """
  def run_chain_with_feedback(program, [a, b, c, d, e]) do
    {:ok, a_pid} = Task.start(Amp, :run, [program, 0, [a], []])
    {:ok, b_pid} = Task.start(Amp, :run, [program, 0, [b], []])
    {:ok, c_pid} = Task.start(Amp, :run, [program, 0, [c], []])
    {:ok, d_pid} = Task.start(Amp, :run, [program, 0, [d], []])
    {:ok, e_pid} = Task.start(Amp, :run, [program, 0, [e], [self()]])
    send(a_pid, {:output_pid, b_pid})
    send(b_pid, {:output_pid, c_pid})
    send(c_pid, {:output_pid, d_pid})
    send(d_pid, {:output_pid, e_pid})
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
        500 ->
          if Process.alive?(pid) do
            wait_for_final_answer_from(pid, val)
          else
            val
          end
    end
  end
  def run_with_input(list, noun, verb) do
    modified_list =
      list
      |> List.replace_at(1, noun)
      |> List.replace_at(2, verb)

    resulting_list = Amp.run(modified_list)
    hd(resulting_list)
  end

  def async_run_with_input([noun, verb], list) do
    {run_with_input(list, noun, verb), noun, verb}
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
      [236453]
  """
  def part2 do
    perms =
      5..9
      |> Enum.to_list()
      |> permutations

    for list <- perms do
      run_chain_with_feedback(@input, list)
    end
    |> List.flatten()
    |> Enum.max()
  end
end
