defmodule SecretHandshake do
  use Bitwise, only_operators: true

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @reverseSecret 16
  @secrets %{
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump",
    @reverseSecret => "do nothing"
  }
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Enum.reduce(@secrets, [], fn secret, acc ->
      number = elem(secret, 0)
      cond do
        (number &&& code) == @reverseSecret ->
          Enum.reverse(acc)
        (number &&& code) == number ->
          acc ++ [elem(secret, 1)]
        true ->
          acc
      end
    end )
  end
end
