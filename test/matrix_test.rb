require 'test_helper'
require 'matrix'

class MatrixTest < Matrix::Test
  def test_that_it_has_a_version_number
    refute_nil Matrix::VERSION
  end

  def test_size
    matrix = Matrix::Matrix.new(3, 2)

    assert_equal matrix.rows, 3
    assert_equal matrix.cols, 2
  end

  def test_equal
    a = Matrix::Matrix.new(2, 2, 1)
    b = Matrix::Matrix.new(2, 2, 1)

    assert_equal a, b
  end

  def test_not_eqaul
    a = Matrix::Matrix.new(2, 2, 1)
    b = Matrix::Matrix.new(2, 2, 2)

    assert_equal a == b, false
  end

  def test_mul
    a = Matrix::Matrix.new(3, 2, [[1, 2], [-2, -3], [-1, 0]])
    b = Matrix::Matrix.new(2, 2, [[-2, -4], [-5, 3]])
    c = Matrix::Matrix.new(3, 2, [[-12, 2], [19, -1], [2, 4]])

    assert_equal a * b, c
  end

  def test_mul_numeric
    a = Matrix::Matrix.new(2, 2, 2)
    b = Matrix::Matrix.new(2, 2, 4)

    assert_equal a * 2, b
  end

  def test_add
    a = Matrix::Matrix.new(2, 3, [[1, -4, 2], [3, -2, 1]])
    b = Matrix::Matrix.new(2, 3, [[2, 1, -3], [4, 3, -2]])
    c = Matrix::Matrix.new(2, 3, [[3, -3, -1], [7, 1, -1]])

    assert_equal a + b, c
  end

  def test_add_num
    a = Matrix::Matrix.new(2, 2, 2)
    b = Matrix::Matrix.new(2, 2, 3)

    assert_equal a + 1, b
  end

  def test_lala
    a = Matrix::Matrix.new(3, 2, [[1, 2], [-2, -3], [-1, 0]])
    b = Matrix::Matrix.new(2, 2, [[-2, -5], [-4, 3]])
    c = Matrix::Matrix.new(2, 2, [[-2, -4], [-3, 1]])

    #D = 2AC − 4AB

    _2c = c * 2

    puts _2c.inspect
  end
end
