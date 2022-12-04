defmodule AdventOfCode.Day4.Part1Test do
  use ExUnit.Case
  alias AdventOfCode.Day4.Part1
  doctest AdventOfCode.Day4.Part1

  describe "process_pair" do
    test "correctly gets a pair of sets" do
      assert Part1.process_pair("2-4,6-8") == [
        MapSet.new([2, 3, 4]),
        MapSet.new([6, 7, 8])
      ]
    end
  end

  describe "subset?" do
    test "correctly determines pair overlaps" do
      assert Part1.overlaps?([MapSet.new([6]), MapSet.new([4, 5, 6])]) == true
      assert Part1.overlaps?([MapSet.new([2, 3, 4, 5, 6, 7, 8]), MapSet.new([3, 4, 5, 6, 7])]) == true
    end

    test "correctly determines pair does not overlap" do
    assert Part1.overlaps?([MapSet.new([2, 3, 4]), MapSet.new([6, 7, 8])]) == false
      assert Part1.overlaps?([MapSet.new([2, 3]), MapSet.new([4, 5])]) == false
      assert Part1.overlaps?([MapSet.new([5, 6, 7]), MapSet.new([7, 8, 9])]) == false
    end
  end

  describe "solve" do
    assert Part1.solve() == 477
  end
end
