defmodule AdventOfCode.Day3.Part1Test do
  use ExUnit.Case
  alias AdventOfCode.Day3.Part1
  doctest AdventOfCode.Day3.Part1

  describe "get_compartments" do
    test "correctly compartmentalizes vJrwpWtwJgWrhcsFMMfFFhFp" do
      assert Part1.get_compartments("vJrwpWtwJgWrhcsFMMfFFhFp")
        == {'vJrwpWtwJgWr', 'hcsFMMfFFhFp'}
    end
  end

  describe "get_priority" do
    test "a" do
      assert Part1.item_to_priority("a") == 1
    end

    test "z" do
      assert Part1.item_to_priority("z") == 26
    end

    test "A" do
      assert Part1.item_to_priority("A") == 27
    end

    test "Z" do
      assert Part1.item_to_priority("Z") == 52
    end
  end

  describe "rucksack_to_priority" do
    test "correctly prioritizes the vJrwpWtwJgWrhcsFMMfFFhFp" do
      assert Part1.rucksack_to_priority("vJrwpWtwJgWrhcsFMMfFFhFp") == 16
    end

    test "correctly prioritizes the jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL" do
      assert Part1.rucksack_to_priority("jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL")
        == 38
    end

    test "correctly prioritizes the PmmdzqPrVvPwwTWBwg" do
      assert Part1.rucksack_to_priority("PmmdzqPrVvPwwTWBwg") == 42
    end

    test "correctly prioritizes the wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn" do
      assert Part1.rucksack_to_priority("wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn") == 22
    end

    test "correctly prioritizes the ttgJtRGJQctTZtZT" do
      assert Part1.rucksack_to_priority("ttgJtRGJQctTZtZT") == 20
    end

    test "correctly prioritizes the CrZsJsPPZsGzwwsLwLmpwMDw" do
      assert Part1.rucksack_to_priority("CrZsJsPPZsGzwwsLwLmpwMDw") == 19
    end
  end

  describe "list_to_priority" do
    test "correctly sums up a list" do
      assert Part1.list_to_priority() == 7878
    end
  end
end
