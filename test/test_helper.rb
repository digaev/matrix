$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'matrix'

require 'minitest/autorun'

module Matrix
  class Test < Minitest::Test
  end
end
