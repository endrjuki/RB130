=begin
Input
- string
  - contains sequence of letters that represent a RNA
  - RNA can be broken down into 3 char sequences that represent codons
  - each codon represents amino acid
  - there are also terminating codons ("STOP" codons), these stop the translation -> all subsequent codonts are ignored after stop codone
OUTPUT
- of_codon(3_sequence_nucleotide)
  - transaltes a string consisiting of 3 chars (codone) into a string (amino acid name)
    - returns a string
- of_rna(rna_sequence)
  - chops up RNA sequence into codons, translates each codone into a amino acid
  - returns an array of strings (amino acids)
=end
class InvalidCodonError < StandardError;end

class Translation
  CODON_TO_AA = {
    AUG: 'Methionine',
    UUU: 'Phenylalanine',
    UUC: 'Phenylalanine',
    UUA: 'Leucine',
    UUG: 'Leucine',
    UCU: 'Serine',
    UCC: 'Serine',
    UCA: 'Serine',
    UCG: 'Serine',
    UAU: 'Tyrosine',
    UAC: 'Tyrosine',
    UGU: 'Cysteine',
    UGC: 'Cysteine',
    UGG: 'Tryptophan',
    UAA: 'STOP',
    UAG: 'STOP',
    UGA: 'STOP'
  }

  def self.of_codon(nucleotide)
    CODON_TO_AA[nucleotide.to_sym]
  end

  def self.of_rna(sequence)
    aa = []
    sequence.chars.each_slice(3) do |codon|
      codon = codon.join
      raise InvalidCodonError unless CODON_TO_AA.has_key?(codon.to_sym)
      translation = CODON_TO_AA[codon.to_sym]
      break if translation == 'STOP'
      aa << translation
    end
    aa
  end


end