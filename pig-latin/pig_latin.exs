defmodule PigLatin do
  @vowels ["a", "e", "i", "o", "u", "yt", "xr"]
  @two_chars ["ch", "qu", "th"]
  @three_chars ["squ", "thr", "sch"]
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  def translate_word(word) do
    cond do
      String.starts_with?(word, @vowels) -> word <> "ay"
      String.starts_with?(word, @two_chars) -> reword(word, 2)
      String.starts_with?(word, @three_chars) -> reword(word, 3)
      true ->
        letters = String.split(word, "", trim: true)
        idx = Enum.find_index(letters, &Enum.member?(@vowels, &1))
        reword(word, idx)
    end
  end

  def reword(word, index) do
    {prefix, rest} = String.split_at(word, index)
    "#{rest}#{prefix}ay"
  end
end
