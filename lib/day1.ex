defmodule Day1 do
  def calc(input) do
    input
    |> contains()
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn line, acc -> adder(line) + acc end)
  end

  def adder(input) do
    broke_up =
      input
      |> String.codepoints()

    first = broke_up |> find_first()
    last = broke_up |> Enum.reverse() |> find_first()

    (Integer.to_string(first) <> Integer.to_string(last))
    |> String.to_integer()
  end

  def find_first([head | tail]) do
    case Integer.parse(head) do
      {int, _} -> int
      :error -> find_first(tail)
    end
  end

  def find_first([]), do: ""

  # # # # # # # # # # # # # # # # # # # # # #

  def contains(input) do
    cond do
      String.contains?(input, "one") -> String.replace(input, "one", "o1e") |> contains()
      String.contains?(input, "two") -> String.replace(input, "two", "t2o") |> contains()
      String.contains?(input, "three") -> String.replace(input, "three", "t3e") |> contains()
      String.contains?(input, "four") -> String.replace(input, "four", "f4r") |> contains()
      String.contains?(input, "five") -> String.replace(input, "five", "f5e") |> contains()
      String.contains?(input, "six") -> String.replace(input, "six", "s6x") |> contains()
      String.contains?(input, "seven") -> String.replace(input, "seven", "s7n") |> contains()
      String.contains?(input, "eight") -> String.replace(input, "eight", "e8t") |> contains()
      String.contains?(input, "nine") -> String.replace(input, "nine", "n9e") |> contains()
      true -> input
    end
  end
end
