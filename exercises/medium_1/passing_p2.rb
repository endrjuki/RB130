birds = %w(raven finch hawk eagle)

def splat_arr(array)
  yield array
end

splat_arr(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end