defmodule AdventOfCode.Day4.Part2Test do
  use ExUnit.Case
  alias AdventOfCode.Day4.Part2
  doctest AdventOfCode.Day4.Part2

  describe "overlaps?" do
    test "correctly determines pair overlaps" do
      assert Part2.overlaps?([
        MapSet.new(Enum.to_list(5..7)),
        MapSet.new(Enum.to_list(7..9))
      ]) == true
      assert Part2.overlaps?([
        MapSet.new(Enum.to_list(2..8)),
        MapSet.new(Enum.to_list(3..7))
      ]) == true
      assert Part2.overlaps?([
        MapSet.new(Enum.to_list(6..6)),
        MapSet.new(Enum.to_list(4..6))
      ]) == true
      assert Part2.overlaps?([
        MapSet.new(Enum.to_list(2..6)),
        MapSet.new(Enum.to_list(4..8))
      ]) == true
    end

    test "correctly determines pair does not overlap" do
      assert Part2.overlaps?([
        MapSet.new(Enum.to_list(2..3)),
        MapSet.new(Enum.to_list(4..5))
      ]) == false
      assert Part2.overlaps?([
        MapSet.new(Enum.to_list(2..4)),
        MapSet.new(Enum.to_list(6..8))
      ]) == false
    end
  end

  describe "solve" do
    test "correctly finds solution" do
      assert Part2.solve() |> IO.inspect == 830
    end
  end
end
