defmodule AOC do
  @moduledoc """
  Advent of code
  """

  @doc """
  Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently,
  something isn't quite adding up.

  Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.

  For example, suppose your expense report contained the following:

  1721
  979
  366
  299
  675
  1456

  In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579,
  so the correct answer is 514579.

  Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply
  them together?
  """
  def day1 do
    {:ok, content} = File.read("input/day1_input")

    nums = content |> String.split("\n", trim: true) |> Enum.map(fn n -> Integer.parse(n) |> elem(0) end)
    # TODO:
    # on each iteration,
    # remove current
    add_hd(nums, [])
  end

  def add_hd([h | []], acc) do
    [a, b] = acc
    a * b
  end

  def add_hd([h | t], accu) do
    expected = 2020
    accu = Enum.reduce(t, accu, fn e, acc ->
      correct? = (h + e == expected)
      case correct? do
        true ->
          [h | [e]]

        false ->
          acc
      end
    end)

    add_hd(t, accu)
  end
end
