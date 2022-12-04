defmodule AdventOfCode.Day4.Part2 do
  alias AdventOfCode.Day4.Part1

  def overlaps?(pair) do
    first = Enum.at(pair, 0)
    second = Enum.at(pair, 1)
    MapSet.intersection(first, second)
    |> MapSet.size() > 0
  end

  def solve() do
    Part1.get_pairs()
    |> Enum.map(&overlaps?/1)
    |> Enum.count(&(&1 == true))
  end
end
