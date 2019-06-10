defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.split(~r/[^[:alnum:]-]/u, trim: true)
    |> Enum.reduce(%{}, &counter/2)
  end

  defp counter(string, acc) do
    Map.update(acc, string, 1, &(&1 + 1))
  end
end
