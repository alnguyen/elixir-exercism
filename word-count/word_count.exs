defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.split(sentence, ~r/(\s|_)/)
    |> Enum.filter(&String.match?(&1, ~r/\w+/))
    |> Enum.reduce(%{}, &counter/2)
  end

  def counter(string, acc) do
    lowercased =
      String.downcase(string)
      |> String.replace(~r/(\W+\B)/, "", global: true)
    case Map.has_key?(acc, lowercased) do
      true ->
        current_count = Map.get(acc, lowercased)
        Map.put(acc, lowercased, current_count + 1)
      false ->
        Map.put(acc, lowercased, 1)
    end
  end
end
