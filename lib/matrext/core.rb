# lib/matrext/core.rb
# The core processing unit

module Matrext
  CHAR_POOL = (33..126).map{ |i| i.chr }
  NOISE_MIN_DEFAULT = 3
  NOISE_MAX_DEFAULT = 5
  DELAY_MIN_DEFAULT = 0.01
  DELAY_MAX_DEFAULT = 0.04
  
  def self.process(options)
    letters = options[:phrase]

    case options[:speed]
    when "fast"
      noise_min = 2
      noise_max = 3
      delay_min = 0.005
      delay_max = 0.010
    when "slow"
      noise_min = 5
      noise_max = 7
      delay_min = 0.015
      delay_max = 0.065
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
