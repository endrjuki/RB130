class TextAnalyzer
  def process
    text = File.open('ta_sample_text.txt')
    yield(text.read)
    file.close
  end

  def self.count_paragraphs(text)
    text.split("\n\n").size
  end

  def self.count_lines(text)
    text.lines.size
  end

  def self.count_words(text)
    text.split(' ').size
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{TextAnalyzer.count_paragraphs(text)} Paragraphs" }
analyzer.process { |text| puts "#{TextAnalyzer.count_lines(text)} Lines" }
analyzer.process { |text| puts "#{TextAnalyzer.count_words(text)} Words" }

# ls solution
class TextAnalyzer
  def process
    file = File.open('ta_sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }