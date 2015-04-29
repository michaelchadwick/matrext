# lib/matrext.rb
require_relative "matrext/string_manip"

module Matrext
  class Base
    def initialize(phrase)
      Matrext::matrextify(phrase)
    end
  end
end
