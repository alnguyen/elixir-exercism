defmodule Scrabble do
  @one ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"]
  @two ["d", "g"]
  @three ["b", "c", "m", "p"]
  @four ["f", "h", "v", "w", "y"]
  @five ["k"]
  @eight ["j", "x"]
  @ten ["q", "z"]
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    String.downcase(word)
    |> String.split("", trim: true)
    |> Enum.reduce(0, &count/2)
  end

  defp count(letter, sum) do
    point =
      cond do
        Enum.member?(@one, letter) -> 1
        Enum.member?(@two, letter) -> 2
        Enum.member?(@three, letter) -> 3
        Enum.member?(@four, letter) -> 4
        Enum.member?(@five, letter) -> 5
        Enum.member?(@eight, letter) -> 8
        Enum.member?(@ten, letter) -> 10
        true -> 0
      end
    sum + point
  end
end
