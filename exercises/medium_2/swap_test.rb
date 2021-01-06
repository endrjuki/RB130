require 'minitest/autorun'
require_relative 'swap.rb'

class SwapTest < Minitest::Test
  def setup
    @sample_text = File.read('sample_text.txt')
    @text_object = Text.new(@sample_text.clone)
  end

  def test_swap
    swap_letter_target = 'e'
    swap_to = '*'
    swapped_sample = @sample_text.gsub(swap_letter_target, swap_to)

    assert_equal swapped_sample, @text_object.swap(swap_letter_target, swap_to)
  end

  def test_word_count
    expected_word_count = @sample_text.split(' ').size
    assert_equal expected_word_count, @text_object.word_count
  end
end