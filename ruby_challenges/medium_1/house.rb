class House

  def self.recite
    phrases = pieces.reverse
    result = ''    

    phrases.each_with_index do |arr, index|
      result << "This is " + arr.first + "\n"
      index.downto(1) { |idx| result << last_first_elem(phrases[idx], phrases[idx - 1]) << "\n" }
      result << "\n" unless index == phrases.size - 1
    end

    result
  end

  private

  def self.last_first_elem(arr1, arr2)
    arr1.last + " " + arr2.first
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
      ['the house that Jack built.']
    ]
  end
end
