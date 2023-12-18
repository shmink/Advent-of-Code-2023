defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "example input" do
    input = """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
    """

    assert Day1.calc(input) == 142
  end

  test "example first line" do
    input = "1abc2"

    assert Day1.adder(input) == 12
  end

  test "example second line" do
    input = "pqr3stu8vwx"

    assert Day1.adder(input) == 38
  end

  test "part 2 - example " do
    input = """
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
    """

    assert Day1.calc(input) == 281
  end

  test "part 2 - example first line" do
    input = "two1nine"

    assert Day1.calc(input) == 29
  end

  test "part 2 - example second line" do
    input = "eightwothree"

    assert Day1.calc(input) == 83
  end

  test "part 2 - example third line" do
    input = "abcone2threexyz"

    assert Day1.calc(input) == 13
  end

  test "part 2 - example fourth line" do
    input = "xtwone3four"

    assert Day1.calc(input) == 24
  end

  test "part 2 - example fifth line" do
    input = "4nineeightseven2"

    assert Day1.calc(input) == 42
  end

  test "part 2 - example sixth line" do
    input = "zoneight234"

    assert Day1.calc(input) == 14
  end

  test "part 2 - example seventh line" do
    input = "7pqrstsixteen"

    assert Day1.calc(input) == 76
  end
end
