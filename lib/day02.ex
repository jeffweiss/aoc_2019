defmodule Day2 do

  @input [
    1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,13,1,19,1,19,10,23,2,10,23,27,1,27,6,31,1,13,31,35,1,13,35,39,1,39,10,43,2,43,13,47,1,47,9,51,2,51,13,55,1,5,55,59,2,59,9,63,1,13,63,67,2,13,67,71,1,71,5,75,2,75,13,79,1,79,6,83,1,83,5,87,2,87,6,91,1,5,91,95,1,95,13,99,2,99,6,103,1,5,103,107,1,107,9,111,2,6,111,115,1,5,115,119,1,119,2,123,1,6,123,0,99,2,14,0,0
  ]
  @doc """
  ## Examples
      iex> Day2.opcode([1,0,0,0,99])
      [2,0,0,0,99]
      iex> Day2.opcode([2,3,0,3,99])
      [2,3,0,6,99]
      iex> Day2.opcode([1,1,1,4,99,5,6,0,99])
      [30,1,1,4,2,5,6,0,99]
  """
  def opcode(list, pc \\ 0)
  def opcode({:halt, list}, _) do
    list
  end
  def opcode(list, pc) do
    remaining_instructions = Enum.drop(list, pc)
    new_list = do_operation(remaining_instructions, list)
    opcode(new_list, pc+4)
  end

  @doc """
  ## Examples
      iex> Day2.do_operation([1,0,0,0,99], [1,0,0,0,99])
      [2,0,0,0,99]
      iex> Day2.do_operation([2,3,0,3,99], [2,3,0,3,99])
      [2,3,0,6,99]
      iex> Day2.do_operation([99], [2,3,0,3,99])
      {:halt, [2,3,0,3,99]}

  """
  def do_operation([1, p1, p2, p3|_], list) do
    v1 = Enum.at(list, p1)
    v2 = Enum.at(list, p2)
    List.replace_at(list, p3, (v1 + v2))
  end
  def do_operation([2, p1, p2, p3|_], list) do
    v1 = Enum.at(list, p1)
    v2 = Enum.at(list, p2)
    List.replace_at(list, p3, (v1 * v2))
  end
  def do_operation([99|_], list) do
    {:halt, list}
  end

  @doc """
  ## Examples
      iex> Day2.part1
      4090701
  """
  def part1 do
    run_with_input(@input, 12, 2)
  end

  def run_with_input(list, noun, verb) do
    modified_list =
      list
      |> List.replace_at(1, noun)
      |> List.replace_at(2, verb)

    resulting_list = opcode(modified_list)
    hd(resulting_list)
  end

  def async_run_with_input([noun, verb], list) do
    {run_with_input(list, noun, verb), noun, verb}
  end

  @doc """
  ## Examples
      iex> Day2.part2(19690720)
      6421
  """
  def part2(desired_output) do
    for noun <- 0..99, verb <- 0..99 do
      [noun, verb]
    end
    |> Task.async_stream(__MODULE__, :async_run_with_input, [@input], [ordered: false])
    |> Enum.filter( fn x ->
      case x do
        {:ok, {^desired_output, _noun, _verb}} -> true
        _ -> false
      end
    end)
    |> Enum.map(fn {:ok, {_, noun, verb}} -> 100 * noun + verb end)
    |> List.first
  end
end
