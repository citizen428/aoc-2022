defmodule Aoc2022Day2 do
  @rock 1
  @paper 2
  @scissors 3

  @win 6
  @draw 3
  @loss 0

  def score_shape("X"), do: @rock
  def score_shape("Y"), do: @paper
  def score_shape("Z"), do: @scissors

  def score_game("A", "X"), do: @draw
  def score_game("A", "Y"), do: @win
  def score_game("A", "Z"), do: @loss
  def score_game("B", "X"), do: @loss
  def score_game("B", "Y"), do: @draw
  def score_game("B", "Z"), do: @win
  def score_game("C", "X"), do: @win
  def score_game("C", "Y"), do: @loss
  def score_game("C", "Z"), do: @draw
end

File.stream!("input.txt")
|> Stream.map(fn line ->
  [p1, p2] = line |> String.trim() |> String.split(" ")
  Aoc2022Day2.score_shape(p2) + Aoc2022Day2.score_game(p1, p2)
end)
|> Enum.sum()
|> IO.puts()
