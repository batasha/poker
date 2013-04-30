class Array

  def p_uniq
    unique = []

    self.each do |el|
      unique << el unless self.count(el) != 1
    end

    unique
  end
  #   unique = []
  #
  #   self.size.times do |i|
  #     matched = false
  #     puts "In size"
  #     puts matched
  #     (...self.size).each do |j|
  #       matched = true if self[i] == self[j]
  #       unique << self.shift unless matched
  #     end
  #   end
  #
  #   unique
  # end

end