defmodule ProteinTranslation do
  @codons %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    to_charlist(rna)
    |> Enum.chunk_every(3)
    |> translate
    |> finalize
  end

  def finalize(result) do
    case result do
      {:ok, translation} ->
        result = Enum.filter(elem(result, 1), fn protein -> protein != "STOP" end)
        {:ok, result}
      {:error, error} ->
        {:error, "invalid RNA"}
    end
  end

  def translate(codons) do
    Enum.reduce(codons, {:ok, []}, fn codon, acc ->
      case of_codon(to_string(codon)) do
        {:ok, "STOP"} ->
          {:ok, elem(acc, 1) ++ ["STOP"]}
        {:ok, protein} ->
          translated = elem(acc, 1)
          unless List.last(translated) == "STOP" do
            {:ok, translated ++ [protein]}
          else
            acc
          end
        _ -> {:error, "invalid"}
      end
    end)
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    codon = Map.fetch(@codons, codon)
    case codon do
      :error -> {:error, "invalid codon"}
      _ -> codon
    end
  end
end
