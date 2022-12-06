defmodule AdventOfCode.Day5.Part1Test do
  use ExUnit.Case
  import AdventOfCode.Day5.Part1

  test "process_cargo_row correctly parses cargo" do
    assert process_cargo_row("[F]         [L]     [M]            ") ==
      ["F", "_", "_", "L", "_", "M", "_", "_", "_"]
    assert process_cargo_row("[J] [V] [G] [B] [F] [G] [D] [H] [G]") ==
      ["J", "V", "G", "B", "F", "G", "D", "H", "G"]
    assert process_cargo_row(" 1   2   3   4   5   6   7   8   9 ") ==
      ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  test "process_cargo_list correctly parses list of cargo" do
    assert process_cargo_list([
      "[D]        ",
      "[N] [C]    ",
      "[Z] [M] [P]",
      " 1   2   3 "
    ]) == [
      ["Z", "M", "P"],
      ["N", "C", "_"],
      ["D", "_", "_"]
    ]
  end

  test "tranpose correctly transposes a nested list" do
    assert transpose([
      [1, 2, 3],
      [4, 5, 0],
      [6, 0, 0]
    ]) == [
      [1, 4, 6],
      [2, 5, 0],
      [3, 0, 0]
    ]
  end

  test "cargo_list_to_stack correctly parses list into stack" do
    assert cargo_list_to_stack([
      "[D]        ",
      "[N] [C]    ",
      "[Z] [M] [P]",
      " 1   2   3 "
    ]) == [
      ["Z", "N", "D"],
      ["M", "C"],
      ["P"]
    ]
  end

  test "process_procedure_row correctly parses procedure" do
    assert process_procedure_row("move 1 from 2 to 1") ==
      %Procedure{move: 1, from: 2, to: 1}
    assert process_procedure_row("move 3 from 1 to 3") ==
      %Procedure{move: 3, from: 1, to: 3}
    assert process_procedure_row("move 2 from 2 to 1") ==
      %Procedure{move: 2, from: 2, to: 1}
    assert process_procedure_row("move 1 from 1 to 2") ==
      %Procedure{move: 1, from: 1, to: 2}
  end

  test "process_procedure_list correctly parse list of procedures" do
    assert process_procedure_list([
      "move 1 from 2 to 1",
      "move 3 from 1 to 3",
      "move 2 from 2 to 1",
      "move 1 from 1 to 2"
    ]) == [
      %Procedure{move: 1, from: 2, to: 1},
      %Procedure{move: 3, from: 1, to: 3},
      %Procedure{move: 2, from: 2, to: 1},
      %Procedure{move: 1, from: 1, to: 2}
    ]
  end

  test "perform_procedure correctly moves stuff in the stack" do
    assert perform_procedure(%{move: 1, from: 2, to: 1}, [
      ["N", "Z"],
      ["M", "C", "D"],
      ["P"]
    ]) == [
      ["N", "Z", "D"],
      ["M", "C"],
      ["P"]
    ]
  end

  test "solve" do
    assert solve() == "TDCHVHJTG"
  end
end
