defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size < 1 do
    []
  end

  def slices(s, size) do
    cond do
      size > String.length(s) -> []
      size === String.length(s) -> [s]
      true ->
        slice = String.slice(s, 0..size - 1)
        remaining = elem(String.split_at(s, 1), 1)
        [slice | slices(remaining, size)]
    end
  end
end
