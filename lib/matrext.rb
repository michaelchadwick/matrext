# lib/matrext.rb
# Main jumping off point

require_relative 'matrext/core'

module Matrext
  class Base
    def initialize(options)
      Matrext.process(options)
    end
  end
end
