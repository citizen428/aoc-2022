File.stream!("input.txt")
|> Stream.map(fn line ->
  line
  |> String.trim()
  |> String.split(",")
  |> Enum.map(fn pairs ->
    pairs
    |> String.split("-")
    |> Enum.map(&String.to_integer(&1, 10))
  end)
end)
|> Stream.filter(fn [[s1, e1], [s2, e2]] -> e1 >= s2 and e2 >= s1 end)
|> Enum.count()
|> IO.puts()
