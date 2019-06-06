defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @string_pairs [
    {3, "Pling"},
    {5, "Plang"},
    {7, "Plong"}
  ]

  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    Enum.reduce(@string_pairs, "", fn tuple, acc ->
      case Integer.mod(number, elem(tuple, 0)) do
        0 -> acc <> elem(tuple, 1)
        _ -> acc
      end
    end)
    |> convert(number)
  end

  def convert(s, number) do
    cond do
      String.length(s) > 0 -> s
      true -> to_string(number)
    end
  end
end
