# lib/matrext/core.rb
# The core processing unit

require 'date'

module Matrext
  CHAR_POOL = (33..126).map{ |i| i.chr }
  NOISE_MIN_DEFAULT = 3
  NOISE_MAX_DEFAULT = 5
  DELAY_MIN_DEFAULT = 0.01
  DELAY_MAX_DEFAULT = 0.04
  
  def self.process(options)
    letters = options[:phrase]

    start = DateTime.now
    puts "options[:speed] = #{options[:speed]}"
    case options[:speed]
    when "fast"
      puts "going fast: #{start}"
      puts 
      noise_min = 1
      noise_max = 3
      delay_min = 0.001
      delay_max = 0.010
    when "slow"
      puts "going slow: #{start}"
      noise_min = 5
      noise_max = 7
      delay_min = 0.015
      delay_max = 0.065
    else
      puts "going normal: #{start}"
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
    
    stop = DateTime.now
    puts "\nstopped: #{stop}"
    duration = ((stop - start) * 24 * 60 * 60 * 1000).to_i
    puts "#{duration} ms"
  end
end
