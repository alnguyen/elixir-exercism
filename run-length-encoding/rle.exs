defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.scan(~r/(.)\1*/, string)
    |> Enum.map_join("", fn set ->
      pack(String.length(Enum.at(set, 0)), Enum.at(set, 1))
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.scan(~r/\d*./, string)
    |> List.flatten()
    |> Enum.reduce("", &unpack/2)
  end

  def decode(string) when string === "" do
    ""
  end

  def pack(count, letter) when count > 1 do
    "#{count}#{letter}"
  end

  def pack(count, letter) when count === 1 do
    letter
  end

  def unpack(letter, string) do
    cond do
      String.length(letter) > 1 ->
        String.split_at(letter, -1)
        |> duplicate()
        |> join(string)
      true -> join(letter, string)
    end
  end

  def duplicate(tuple) do
    String.duplicate(elem(tuple, 1), String.to_integer(elem(tuple, 0)))
  end

  def join(s1, s2) do
    s2 <> s1
  end
end
