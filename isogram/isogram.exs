defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.replace(~r/\W/, "")
    |> String.split("", trim: true)
    |> is_isogram?
  end

  defp is_isogram?(letters) do
    letters == Enum.uniq(letters)
  end
end
