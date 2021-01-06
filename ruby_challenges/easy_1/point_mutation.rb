class DNA
  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    sequence, other_sequence = match_sequence_size(other_sequence)
    sequence.chars.zip(other_sequence.chars).count { |a, b| a != b }
  end

  private

  def match_sequence_size(other_sequence)
    if @sequence.size > other_sequence.size
      sequence = shorten_sequence(@sequence, other_sequence)
    elsif @sequence.size < other_sequence.size
      sequence = @sequence
      other_sequence = shorten_sequence(other_sequence, sequence)
    else
      sequence = @sequence
    end
    [sequence, other_sequence]
  end

  def shorten_sequence(source, target)
    source = source[0, target.size]
  end
end