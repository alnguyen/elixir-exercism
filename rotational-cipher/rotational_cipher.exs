defmodule RotationalCipher do
  @alpha_upper ?A..?Z
  @alpha_lower ?a..?z
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    to_charlist(text)
    |> Enum.map(&(do_rotation(&1, shift)))
    |> to_string
  end

  def do_rotation(char, shift) when char in @alpha_upper do
    if char + shift > ?Z do
      ?A + char + shift - ?Z - 1
    else
      char + shift
    end
  end

  def do_rotation(char, shift) when char in @alpha_lower do
    if char + shift > ?z do
      ?a + char + shift - ?z - 1
    else
      char + shift
    end
  end

  def do_rotation(char, shift) do
    char
  end
end
