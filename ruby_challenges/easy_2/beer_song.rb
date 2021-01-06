require "pry"
class BeerSong
  MAX_BOTTLES_ON_WALL = 99

  def verses(*n)
    verses = ''
    n.each_with_index do |nr, idx|
      verses << verse(nr)
      verses << "\n" unless idx == n.size - 1      
    end

    verses
  end

  def lyrics
    arr = (0..MAX_BOTTLES_ON_WALL).to_a.reverse
    verses(*arr)
  end
  
  def verse(n)
    multiple_bottles_verse_pt1 = "#{n} bottles of beer on the wall, #{n} bottles of beer.\n"
    multiple_bottles_verse_pt2 = "Take one down and pass it around, #{n - 1} bottles of beer on the wall.\n"
    multiple_bottles_verse_one_left = "Take one down and pass it around, #{n - 1} bottle of beer on the wall.\n"

    one_bottle_verse = "#{n} bottle of beer on the wall, #{n} bottle of beer.\n" \
                       "Take it down and pass it around, no more bottles of beer on the wall.\n"      

    no_bottles_verse = "No more bottles of beer on the wall, no more bottles of beer.\n" \
                       "Go to the store and buy some more, #{MAX_BOTTLES_ON_WALL} bottles of beer on the wall.\n"
    #binding.pry
    return_string = ''
    if n > 1
      return_string << multiple_bottles_verse_pt1
      if n > 2
        return_string << multiple_bottles_verse_pt2
      else
        return_string << multiple_bottles_verse_one_left
      end

    elsif n == 1
      return_string << one_bottle_verse

    else
      return_string << no_bottles_verse
    end

    return_string
  end
end