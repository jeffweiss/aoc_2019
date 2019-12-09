defmodule Day5 do

  @doc """
  ## Examples
      iex> Day5.part1
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 13547311]
  """
  def part1 do
    input()
    |> Map.put(:inputs, [1])
    |> IntCode.run_program
    |> Map.get(:output)
  end

  @doc """
  ## Examples
      iex> Day5.part2
      [236453]
  """
  def part2 do
    input()
    |> Map.put(:inputs, [5])
    |> IntCode.run_program
    |> Map.get(:output)
  end

  def input do
    "priv/d05p1"
    |> File.read!
    |> String.trim
    |> IntCode.load_program
  end
end
