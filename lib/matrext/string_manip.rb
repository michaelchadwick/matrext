module Matrext
  CHAR_POOL = (33..126).map{ |i| i.chr }
  
  def self.matrextify(phrase)
    letters = phrase

    letters.each_char do |l|
      letter_noise = rand(1..10)
      letter_delay = rand(0.005..0.04)  
      
      (0..letter_noise).each do |n|
        print CHAR_POOL[(rand * 36).floor]
        sleep(letter_delay)
        print "\b"
      end
      print l.upcase
      sleep(letter_delay)
    end
    puts
  end
end
