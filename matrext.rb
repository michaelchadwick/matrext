#!/usr/bin/env ruby

require 'optparse'
require_relative 'string_manip'
require_relative 'version'

def parse_options
  options = {:phrase => 'hello world'}

  optparse = OptionParser.new do |opts|
    opts.banner = 'usage: matrext "phrase"'

    opts.on('-v', '--version', 'Display version number and exit') do
      puts "#{$PROGRAM_NAME} #{Matrext::VERSION}"
      exit
    end

    opts.on('-h', '--help', 'Display this screen and exit') do
      puts opts
      exit
    end
  end

  options[:usage] = optparse.to_s
  optparse.parse!()

  return options
end

def print_error(error)
  case error
  when OptionParser::InvalidOption
    puts "#{$PROGRAM_NAME}: illegal option #{error.args.join(' ')}"
  else
    puts "An unexpected error occurred while running #{$PROGRAM_NAME}:"
    puts "  #{error}\n"
  end
end

begin
  options = parse_options

  phrase = ARGV[0]
  
  Matrext::matrextify(phrase)
rescue => error
  print_error(error)
  exit(false)
end
