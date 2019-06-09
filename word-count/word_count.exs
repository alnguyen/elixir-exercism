defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.split(sentence, ~r/(\s|_)|(\W+\B)/, trim: true)
    |> Enum.reduce(%{}, &counter/2)
  end

  defp counter(string, acc) do
    lowercased = String.downcase(string)
    Map.update(acc, lowercased, 1, &(&1 + 1))
  end
end
