File.stream!("input.txt")
|> Enum.chunk_while(
  0,
  fn
    "\n", acc ->
      {:cont, acc, 0}

    line, acc ->
      n = line |> String.trim() |> String.to_integer()
      {:cont, acc + n}
  end,
  fn
    0 -> {:cont, 0}
    acc -> {:cont, acc, 0}
  end
)
|> Enum.max()
|> IO.puts()
