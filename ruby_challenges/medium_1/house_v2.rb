class House

  def self.recite
    result = ''
    lines = pieces
    1.upto(lines.size) { |line_amount| result << paragraph(lines[-line_amount..-1]) }
    result.chomp
  end

  private


  def self.paragraph(lines)
    result = "This is"
    lines.each { |line| result << " #{line.join("\n")}" }

    "#{result}.\n\n"
  end

  def self.pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
