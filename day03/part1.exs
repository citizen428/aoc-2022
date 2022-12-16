File.stream!("input.txt")
|> Stream.map(fn line ->
  line = String.trim(line)
  String.split_at(line, div(String.length(line), 2))
end)
|> Stream.map(fn {comp1, comp2} ->
  comp2 = to_charlist(comp2)
  Enum.find(to_charlist(comp1), &(&1 in comp2))
end)
|> Stream.map(fn
  ch when ch >= ?a and ch <= ?z -> ch - 96
  ch when ch >= ?A and ch <= ?Z -> ch - 38
end)
|> Enum.sum()
|> IO.puts()
