defmodule AdventOfCode.Day6Test do
  use ExUnit.Case
  import AdventOfCode.Day6
  doctest AdventOfCode.Day6

  test "start_of_packet_marker successfully finds start marker of length 4" do
    assert start_of_packet_marker("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 4) == 7
    assert start_of_packet_marker("bvwbjplbgvbhsrlpgdmjqwftvncz", 4) == 5
    assert start_of_packet_marker("nppdvjthqldpwncqszvftbrmjlhg", 4) == 6
    assert start_of_packet_marker("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 4) == 10
    assert start_of_packet_marker("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 4) == 11
  end

  test "start_of_packet_marker successfully finds start marker of length 14" do
    assert start_of_packet_marker("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 14) == 19
    assert start_of_packet_marker("bvwbjplbgvbhsrlpgdmjqwftvncz", 14) == 23
    assert start_of_packet_marker("nppdvjthqldpwncqszvftbrmjlhg", 14) == 23
    assert start_of_packet_marker("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 14) == 29
    assert start_of_packet_marker("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 14) == 26
  end

  test "solve correctly finds solution" do
    assert solve(4) == 1760
    assert solve(14) == 2974
  end
end
