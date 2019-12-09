defmodule Day9 do
  @doc """
  not 203 (too low)
  not 1187721666102244 (too high)
  ## Examples
      iex> Day9.part1
      [2671328082]

  """
  def part1 do
    "priv/d09p1"
    |> File.read!()
    |> String.trim()
    |> IntCode.load_program()
    |> Map.put(:inputs, [1])
    |> IntCode.run_program()
  end

  @doc """
  ## Examples
      iex> Day9.part2
      [59095]
  """
  def part2 do
    "priv/d09p1"
    |> File.read!()
    |> String.trim()
    |> IntCode.load_program()
    |> Map.put(:inputs, [2])
    |> IntCode.run_program()
  end
end
