defmodule Aoc2019Test do
  use ExUnit.Case
  doctest Aoc2019
  doctest Day1
  doctest Day2
  doctest Day3
  doctest Day4
  doctest Day5
  doctest Day6
  doctest Day7
  doctest Day8
  doctest Day9
  doctest IntCode

  test "greets the world" do
    assert Aoc2019.hello() == :world
  end
end
