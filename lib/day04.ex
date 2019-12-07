defmodule Day4 do
  def part1 do
    Enum.filter(124_075..580_769, &number_okay?/1)
    |> length()
  end

  # not 1608
  # not 1531
  # not 1338
  def part2 do
    124_075..580_769
    |> Stream.map(&Integer.digits/1)
    |> Stream.filter(&increasing?/1)
    |> Stream.filter(&has_double?/1)
    |> Stream.filter(&(!bulk_match?(&1)))
    |> Enum.to_list()
  end

  def number_okay?(number) do
    digits = Integer.digits(number)
    has_double?(digits) && increasing?(digits)
  end

  def number_okay2?(number) do
    digits = Integer.digits(number)
    has_double?(digits) && increasing?(digits) && !bulk_match?(digits)
  end

  @doc """
      iex> Day4.has_double?([1,1,1,1,1,1])
      true
      iex> Day4.has_double?([2,2,3,4,5,0])
      true
      iex> Day4.has_double?([1,2,3,7,8,9])
      false
  """
  def has_double?([]), do: false
  def has_double?([_]), do: false
  def has_double?([x, x | rest]), do: true
  def has_double?([x | rest]), do: has_double?(rest)

  def increasing?([_]), do: true

  def increasing?([x, y | rest]) when x <= y do
    increasing?([y | rest])
  end

  def increasing?(_), do: false

  @doc """
      iex> Day4.bulk_match?([1,1,2,2,3,3])
      false
      iex> Day4.bulk_match?([1,2,3,4,4,4])
      true
      iex> Day4.bulk_match?([1,1,1,1,2,2])
      false
      iex> Day4.bulk_match?([1,1,1,2,2,2])
      true
      iex> Day4.bulk_match?([1,1,2,2,2,2])
      false
      iex> Day4.bulk_match?([1,2,2,2,2,2])
      true
      iex> Day4.bulk_match?([2,2,2,2,2,2])
      true
      iex> Day4.bulk_match?([2,2,2,2,2,2])
      true
      iex> Day4.bulk_match?([1,2,5,5,5,8])
      true
  """
  def bulk_match?([x, x, x, x, x, x]), do: true
  def bulk_match?([x, x, x, x, x, _]), do: true
  def bulk_match?([x, x, x, x, y, y]), do: false
  def bulk_match?([y, y, x, x, x, _]), do: false
  def bulk_match?([y, z, x, x, x, _]), do: true
  def bulk_match?([_, x, x, x, x, _]), do: true
  def bulk_match?([_, x, x, x, x, _]), do: true
  def bulk_match?([x, x, x, y, y, y]), do: true
  def bulk_match?([x, x, x, z, y, y]), do: false
  def bulk_match?([x, x, x, y, y, z]), do: false
  def bulk_match?([x, x, x, _, _, _]), do: true
  def bulk_match?([_, x, x, x, y, y]), do: false
  def bulk_match?([_, x, x, x, y, z]), do: true
  def bulk_match?([y, y, x, x, x, _]), do: false
  def bulk_match?([_, y, y, x, x, x]), do: false
  def bulk_match?([y, y, _, x, x, x]), do: false
  def bulk_match?([_, _, _, x, x, x]), do: true
  def bulk_match?([y, z, x, x, x, _]), do: true
  def bulk_match?(_), do: false
end
