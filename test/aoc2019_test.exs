defmodule Aoc2019Test do
  use ExUnit.Case
  doctest Aoc2019
  doctest Day1

  test "greets the world" do
    assert Aoc2019.hello() == :world
  end
end
