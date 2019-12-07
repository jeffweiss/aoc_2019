defmodule Day1 do
  @input [
    95249,
    126_697,
    77237,
    80994,
    91186,
    53823,
    115_101,
    130_919,
    88127,
    141_736,
    53882,
    67432,
    94292,
    73223,
    139_947,
    66450,
    55710,
    128_647,
    73874,
    57163,
    139_502,
    140_285,
    119_987,
    125_308,
    77561,
    74573,
    85364,
    92991,
    102_935,
    71259,
    99622,
    118_876,
    124_482,
    148_442,
    77664,
    90453,
    111_933,
    110_449,
    74172,
    148_641,
    58574,
    135_365,
    84703,
    81077,
    65290,
    136_749,
    127_256,
    94872,
    143_534,
    81702,
    59493,
    72365,
    69497,
    149_082,
    79552,
    78509,
    73759,
    147_439,
    97535,
    118_952,
    114_301,
    104_401,
    95080,
    100_907,
    132_914,
    136_096,
    52451,
    70544,
    120_717,
    107_010,
    76840,
    51324,
    135_258,
    73985,
    118_067,
    86602,
    95127,
    51182,
    84838,
    60430,
    86347,
    140_487,
    147_777,
    85143,
    114_215,
    100_410,
    126_504,
    69630,
    123_656,
    108_886,
    144_192,
    123_620,
    147_217,
    146_090,
    101_966,
    80577,
    62193,
    143_331,
    79947,
    93518
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
    |> Enum.sum()
  end

  @doc """
  ## Examples

      iex> Day1.part2()
      4994396

  """
  def part2 do
    @input
    |> Enum.map(&fuel_for_fuel/1)
    |> Enum.sum()
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
