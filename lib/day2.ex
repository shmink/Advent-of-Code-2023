defmodule Day2 do
  def part1(input) do
    input
    |> parser
    |> Enum.reduce(0, fn {id, %{green: green, red: red, blue: blue}}, acc ->
      if red <= 12 && green <= 13 && blue <= 14 do
        acc + id
      else
        acc
      end
    end)
  end

  def part2(input) do
    input
    |> parser
    |> Enum.reduce(0, fn {_id, %{green: green, red: red, blue: blue}}, acc ->
      acc + green * red * blue
    end)
  end

  def parser(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&game_parser/1)
  end

  def game_parser(input) do
    [game, rounds] = String.split(input, ":")
    id = String.replace(game, "Game ", "") |> String.to_integer()
    cubes = String.split(rounds, :binary.compile_pattern([";", ","])) |> List.flatten()

    {id, cube_manager(cubes)}
  end

  def cube_manager([], current), do: current

  def cube_manager([head | tail], current \\ %{}) do
    {colour, amount} = head |> cube_parser()

    existing_amount = Map.get(current, colour)

    updated =
      Map.update(current, colour, amount, fn _x ->
        if existing_amount <= amount do
          amount
        else
          existing_amount
        end
      end)

    cube_manager(tail, updated)
  end

  def cube_parser(cube_amount) do
    [amount, colour] =
      cube_amount
      |> String.split(" ", trim: true)

    {String.to_atom(colour), String.to_integer(amount)}
  end
end
