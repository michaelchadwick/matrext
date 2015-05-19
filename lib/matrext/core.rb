# lib/matrext/core.rb
# The core processing unit

require 'pry'

module Matrext
  CHAR_POOL = (33..126).map{ |i| i.chr }
  NOISE_MIN_DEFAULT = 4
  NOISE_MAX_DEFAULT = 6
  DELAY_MIN_DEFAULT = 0.009
  DELAY_MAX_DEFAULT = 0.012
  
  def self.process(options)
    letters = options[:phrase]

    unless options[:speed].nil?
      speed = options[:speed].to_sym
    end

    case speed
    when :insane
      noise_min = 1
      noise_max = 2
      delay_min = 0.0005
      delay_max = 0.0015
    when :fast
      noise_min = 2
      noise_max = 4
      delay_min = 0.003
      delay_max = 0.005
    when :slow
      noise_min = 5
      noise_max = 7
      delay_min = 0.03
      delay_max = 0.05
    else
      noise_min = NOISE_MIN_DEFAULT
      noise_max = NOISE_MIN_DEFAULT
      delay_min = DELAY_MIN_DEFAULT
      delay_max = DELAY_MAX_DEFAULT
    end

    letters.each_char do |l|
      letter_noise = rand(noise_min..noise_max)
      letter_delay = rand(delay_min..delay_max)
      
      (0..letter_noise).each do |n|
        print CHAR_POOL[(rand * 36).floor]
        sleep(letter_delay)
        print "\b"
      end
      print l.upcase
      sleep(letter_delay)
    end

    if options[:oneline].equal? false
      puts
    end
  end
end
