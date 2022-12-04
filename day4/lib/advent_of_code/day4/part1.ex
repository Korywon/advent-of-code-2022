defmodule AdventOfCode.Day4.Part1 do
  def assignment_to_sets(assignment) do
    [from, through] = String.split(assignment, "-")
    |> Enum.map(&String.to_integer/1)
    from..through
    |> Enum.to_list()
    |> MapSet.new()
  end

  def process_pair(pair) do
    pair
    |> String.split(",")
    |> Enum.map(&assignment_to_sets/1)
  end

  def get_pairs() do
    File.read!("input.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(&process_pair/1)
  end

  def overlaps?(pair) do
    first = Enum.at(pair, 0)
    second = Enum.at(pair, 1)
    MapSet.subset?(first, second) or MapSet.subset?(second, first)
  end

  def solve() do
    get_pairs()
    |> Enum.map(&overlaps?/1)
    |> Enum.count(&(&1 == true))
  end
end
