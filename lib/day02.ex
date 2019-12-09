defmodule Day2 do

  @doc """
  ## Examples
      iex> Day2.part1
      4090701
  """
  def part1 do
    run_with_input(input(), 12, 2)
  end

  def input do
    File.read!("priv/d02p1")
    |> String.trim
    |> IntCode.load_program
  end

  def run_with_input(program, noun, verb) do
    modified_memory =
      program.memory
      |> Map.put(1, noun)
      |> Map.put(2, verb)

    %{cpu: cpu} = IntCode.run_program(%IntCode{program | memory: modified_memory})
    cpu.memory[0]
  end

  def async_run_with_input([noun, verb], program) do
    {run_with_input(program, noun, verb), noun, verb}
  end

  @doc """
  ## Examples
      iex> Day2.part2(19690720)
      6421
  """
  def part2(desired_output) do
    program = input()
    for noun <- 0..99, verb <- 0..99 do
      [noun, verb]
    end
    |> Task.async_stream(__MODULE__, :async_run_with_input, [program], ordered: false)
    |> Enum.filter(fn x ->
      case x do
        {:ok, {^desired_output, _noun, _verb}} -> true
        _ -> false
      end
    end)
    |> Enum.map(fn {:ok, {_, noun, verb}} -> 100 * noun + verb end)
    |> List.first()
  end
end
