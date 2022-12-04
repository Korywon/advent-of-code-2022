defmodule AdventOfCode.Day3.Part2 do
  alias AdventOfCode.Day3.Part1

  @group_size 3

  def rucksack_to_set(rucksack) do
    rucksack
    |> String.to_charlist()
    |> MapSet.new()
  end

  def group_to_priority(group_list) do
    Enum.reduce(group_list, hd(group_list), fn group, intersection ->
      MapSet.intersection(intersection, group)
    end)
    |> MapSet.to_list()
    |> List.to_string()
    |> Part1.item_to_priority()
  end

  def list_to_priority() do
    Part1.read_file_lines()
    |> Enum.map(fn rucksack -> rucksack_to_set(rucksack) end)
    |> Enum.chunk_every(@group_size)
    |> Enum.map(fn group_list -> group_to_priority(group_list) end)
    |> Enum.sum()
  end
end
