# lib/matrext/core.rb
# The core processing unit

require 'colorize'

module Matrext
  NOISE_MIN_DEFAULT = 4
  NOISE_MAX_DEFAULT = 6
  DELAY_MIN_DEFAULT = 0.009
  DELAY_MAX_DEFAULT = 0.012

  attr_accessor :alpha_chars, :numeric_chars, :random_chars

  def self.process(options = {})
    defaults = {
      oneline:    false,
      alpha:      true,
      numeric:    true,
      random:     true,
      color:      nil,
      background: nil
    }
    options = defaults.merge(options)

    character_pool = create_character_pool(options)

    letters = options[:phrase]

    speed = options[:speed].to_sym unless options[:speed].nil?

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

      (0..letter_noise).each do
        print get_random_letter(character_pool).colorize(color: options[:color], background: options[:background])
        sleep(letter_delay)
        print "\b"
      end

      if options[:color].nil?
        print l.upcase
      else
        print l.upcase.colorize(color: options[:color], background: options[:background])
      end

      sleep(letter_delay)
    end

    puts unless options[:oneline].equal? true
  end

  private

  def self.alpha_chars
    ((65..90).map(&:chr) | (97..122).map(&:chr))
  end

  def self.numeric_chars
    (48..57).map(&:chr)
  end

  def self.random_chars
    ((33..47).map(&:chr) | (91..96).map(&:chr) | (123..126).map(&:chr))
  end

  def self.create_character_pool(options)
    chars = []

    chars |= alpha_chars if options[:alpha]
    chars |= numeric_chars if options[:numeric]
    chars |= random_chars if options[:random]

    chars
  end

  def self.get_random_letter(chars)
    chars = ['X'] if chars.length <= 0

    chars[rand(0..chars.length - 1)]
  end
end
