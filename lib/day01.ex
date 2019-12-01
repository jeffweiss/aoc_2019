defmodule Day1 do
  @input [
    95249,
    126697,
    77237,
    80994,
    91186,
    53823,
    115101,
    130919,
    88127,
    141736,
    53882,
    67432,
    94292,
    73223,
    139947,
    66450,
    55710,
    128647,
    73874,
    57163,
    139502,
    140285,
    119987,
    125308,
    77561,
    74573,
    85364,
    92991,
    102935,
    71259,
    99622,
    118876,
    124482,
    148442,
    77664,
    90453,
    111933,
    110449,
    74172,
    148641,
    58574,
    135365,
    84703,
    81077,
    65290,
    136749,
    127256,
    94872,
    143534,
    81702,
    59493,
    72365,
    69497,
    149082,
    79552,
    78509,
    73759,
    147439,
    97535,
    118952,
    114301,
    104401,
    95080,
    100907,
    132914,
    136096,
    52451,
    70544,
    120717,
    107010,
    76840,
    51324,
    135258,
    73985,
    118067,
    86602,
    95127,
    51182,
    84838,
    60430,
    86347,
    140487,
    147777,
    85143,
    114215,
    100410,
    126504,
    69630,
    123656,
    108886,
    144192,
    123620,
    147217,
    146090,
    101966,
    80577,
    62193,
    143331,
    79947,
    93518,
    ]

  @doc """
  ## Examples

      iex> Day1.fuel_required(12)
      2
      iex> Day1.fuel_required(14)
      2
      iex> Day1.fuel_required(1969)
      654
      iex> Day1.fuel_required(100756)
      33583

  """
  def fuel_required(mass) do
    mass
    |> div(3)
    |> Kernel.-(2)
    |> max(0)
  end

  @doc """
  ## Examples

      iex> Day1.part1()
      3331523

  """
  def part1 do
    @input
    |> Enum.map(&fuel_required/1)
    |> Enum.sum
  end

  @doc """
  ## Examples

      iex> Day1.part2()
      4994396

  """
  def part2 do
      @input
      |> Enum.map(&fuel_for_fuel/1)
      |> Enum.sum
  end

  @doc """
  ## Examples
      iex> Day1.fuel_for_fuel(12)
      2
      iex> Day1.fuel_for_fuel(14)
      2
      iex> Day1.fuel_for_fuel(1969)
      966
      iex> Day1.fuel_for_fuel(100756)
      50346
  """
  def fuel_for_fuel(remainder, acc \\ 0)
  def fuel_for_fuel(0, acc), do: acc
  def fuel_for_fuel(remainder, acc) do
    fuel = fuel_required(remainder)
    fuel_for_fuel(fuel, acc + fuel)
  end
end
