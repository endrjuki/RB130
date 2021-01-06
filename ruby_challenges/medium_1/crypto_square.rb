=begin
remove any non alpha chars from the string, downcase
  
=end
class Crypto
  def initialize(string)
    @input = string
  end

  def normalize_plaintext
    @input.downcase.gsub(/[^a-z0-9]/i, '')
  end

  def size
    text_size_sqrt = Math.sqrt(normalize_plaintext.size)
    text_size_sqrt.instance_of?(Integer) ? text_size_sqrt : text_size_sqrt.ceil
  end

  def plaintext_segments
    text_segments = []
    normalize_plaintext.chars.each_slice(size) { |slice| text_segments << slice.join }
    text_segments
  end

  def ciphertext
    text_segments = plaintext_segments
    cipher_txt = ''

    text_segments[0].chars.each_with_index do |_, char_idx|    
      
      text_segments.size.times do |seg_idx|
        char = text_segments[seg_idx][char_idx]        
        cipher_txt << char unless char.nil?
      end  

    end
    cipher_txt
  end

  def normalize_ciphertext
    result = []
    cipher = ciphertext
    cip_size = cipher.size
    rows = Math.sqrt(cip_size).ceil

    if cip_size % rows == 0
      ciphertext.chars.each_slice(cip_size / rows) { |seg| result << seg.join }
    else
      result = overspill_into_shorter_segments(cip_size, rows, cipher) 
    end
    result.join(' ')
  end
  
  private

  def overspill_into_shorter_segments(cipher_size, rows, cipher)
    result = []
    overspill = cipher_size % rows
    short_seg_size = (cipher_size - overspill) / rows 
    long_seg_size = short_seg_size + 1
      
    start_idx = 0
    overspill.times do |_|
      result << cipher[start_idx, long_seg_size]
      start_idx += long_seg_size
    end

    loop do
      break if start_idx >= cipher.size - short_seg_size + 1
      result << cipher[start_idx, short_seg_size]
      start_idx += short_seg_size
    end
    result
  end  
end
