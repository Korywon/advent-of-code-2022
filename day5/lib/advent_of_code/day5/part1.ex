defmodule AdventOfCode.Day5.Part1 do
  def read_input() do
    File.read!("input.txt")
    |> String.split("\n", trim: true)
  end

  # Replaces braces with space, replaces blank space with "_", then splits.
  def process_cargo_row(cargo_row) do
    cargo_row
    |> String.replace(~r/(\[|\])/, " ")
    |> String.replace("    ", "   _")
    |> String.split(" ", trim: true)
  end

  def process_cargo_list(cargo_list) do
    cargo_list
    |> Enum.map(&process_cargo_row/1)
    |> Enum.slice(0..-2)
    |> Enum.reverse()
  end

  # Literally transposes 2D list.
  def transpose([]), do: []
  def transpose([[]|_]), do: []
  def transpose(a) do
    [Enum.map(a, &hd/1) | transpose(Enum.map(a, &tl/1))]
  end

  def cargo_list_to_stack(cargo_list) do
    cargo_list
    |> process_cargo_list()
    |> transpose()
    |> Enum.map(fn stack -> stack |> Enum.reject(&(&1 == "_")) end)
  end

  # Replaces all non-numbers with spaces, then splits it by space characters.
  def process_procedure_row(procedure_row) do
    [move, from, to] = procedure_row
    |> String.replace(~r/[^\d]/, " ")
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
    %Procedure{move: move, from: from, to: to}
  end

  def process_procedure_list(procedure_list) do
    procedure_list
    |> Enum.map(&process_procedure_row/1)
  end

  def perform_procedure(procedure, stack) do
    move = procedure.move - 1
    from = procedure.from - 1
    to = procedure.to - 1

    Enum.reduce(0..move, stack, fn _, curr_stack ->
      {crate, new_from_list} = curr_stack
      |> Enum.at(from)
      |> List.pop_at(-1)

      new_to_list = curr_stack
      |> Enum.at(to)
      |> List.insert_at(-1, crate)

      curr_stack
      |> List.replace_at(from, new_from_list)
      |> List.replace_at(to, new_to_list)
    end)
  end

  def solve() do
    {cargo_list, procedures_list} = read_input()
    |> Enum.split_while(fn line -> not String.match?(line, ~r/m.*/) end)

    stack = cargo_list_to_stack(cargo_list)
    procedures = process_procedure_list(procedures_list)

    Enum.reduce(procedures, stack, &perform_procedure/2)
    |> Enum.map(&List.last/1)
    |> Enum.join("")
  end
end
