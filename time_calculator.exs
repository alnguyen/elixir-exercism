get_input_value = &IO.gets/1

input = IO.gets "Convert (a) decimal to hours or (b) hours to decimal? "

case input do
    "a\n" ->
        value = get_input_value.("Enter decimal to be converted: ")
        value |> String.trim |> (fn n -> Float.parse "0#{n}" end).() |> (fn {x, _y} -> IO.puts x * 60 end).()
    "b\n" ->
        value = get_input_value.("Enter hours to be converted: ")
        value |> (&(String.split(&1, ":", trim: true))).() |> (fn [_hd | tl] -> Float.parse "0#{tl}" end).() |> (fn {x, _y} -> IO.puts x / 60 end).()   
    _ -> IO.puts "INVALID INPUT"
end
