File.stream!("input.txt")
|> Stream.chunk_every(3)
|> Stream.map(fn lines ->
  [l1, l2, l3] = Enum.map(lines, fn line -> String.trim(line) |> to_charlist() end)
  set2 = MapSet.new(l2)

  MapSet.intersection(
    MapSet.intersection(MapSet.new(l1), set2),
    MapSet.intersection(set2, MapSet.new(l3))
  )
  |> Enum.at(0)
end)
|> Stream.map(fn
  ch when ch >= ?a and ch <= ?z -> ch - 96
  ch when ch >= ?A and ch <= ?Z -> ch - 38
end)
|> Enum.sum()
|> IO.puts()
