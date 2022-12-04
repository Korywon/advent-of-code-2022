defmodule AdventOfCode.Day3.Part1 do
  def read_file_lines() do
    File.read!("input.txt")
    |> String.split("\n", trim: true)
  end

  def get_compartments(line) do
    length = String.length(line)
    middle = length / 2 |> trunc

    first_compartment = String.slice(line, 0..middle-1)
    |> String.to_charlist()
    second_compartment = String.slice(line, middle..length)
    |> String.to_charlist()

    {first_compartment, second_compartment}
  end

  @ascii_upper_offset 38
  @ascii_lower_offset 96

  # Converts an item to a priority value. Offsets the ASCII values so that
  # a-z maps to 1-26 and A-Z maps to 27-52.
  def item_to_priority(item) do
    <<value::utf8>> = item
    cond do
      String.upcase(item) == item -> value - @ascii_upper_offset
      String.downcase(item) == item -> value - @ascii_lower_offset
    end
  end

  def rucksack_to_priority(rucksack) do
    {first_compartment, second_compartment} = get_compartments(rucksack)

    first_set = MapSet.new(first_compartment)
    second_set = MapSet.new(second_compartment)

    MapSet.intersection(first_set, second_set)
    |> MapSet.to_list()
    |> List.to_string()
    |> item_to_priority()
  end

  def list_to_priority() do
    AdventOfCode.Day3.Part1.read_file_lines()
    |> Enum.reduce(0, fn line, acc ->
      prio = rucksack_to_priority(line)
      acc + prio
    end)
  end
end
