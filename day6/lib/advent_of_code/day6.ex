defmodule AdventOfCode.Day6 do
  def start_of_packet_marker(packet, start_marker_length) do
    1..String.length(packet) - start_marker_length - 1
    |> Enum.to_list()
    |> Enum.map(fn x ->
      packet
      |> String.slice(x - 1, start_marker_length)
      |> String.to_charlist()
      |> Enum.uniq()
      |> length()
      |> Kernel.==(start_marker_length)
    end)
    |> Enum.find_index(&(&1))
    |> Kernel.+(start_marker_length)
  end

  def solve(start_marker_length) do
    packet = File.read!("input.txt")
    |> String.trim()
    |> start_of_packet_marker(start_marker_length)
  end
end
