defmodule Aoc2022Day2 do
  @rock 1
  @paper 2
  @scissors 3

  @win 6
  @draw 3

  def score_game("A", "X"), do: score_shape("C")
  def score_game("B", "X"), do: score_shape("A")
  def score_game("C", "X"), do: score_shape("B")

  def score_game(x, "Y"), do: score_shape(x) + @draw

  def score_game(x, "Z") do
    case x do
      "A" -> score_shape("B")
      "B" -> score_shape("C")
      "C" -> score_shape("A")
    end + @win
  end

  defp score_shape("A"), do: @rock
  defp score_shape("B"), do: @paper
  defp score_shape("C"), do: @scissors
end

File.stream!("input.txt")
|> Stream.map(&apply(Aoc2022Day2, :score_game, &1 |> String.trim() |> String.split(" ")))
|> Enum.sum()
|> IO.puts()
