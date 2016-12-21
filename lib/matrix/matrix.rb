require 'matrix/errors'

module Matrix
  class Matrix
    attr_reader :matrix, :rows, :cols

    def initialize(rows, cols, default = 0)
      raise InvalidMatrixSize if rows < 1 || cols < 1

      @rows = rows
      @cols = cols
      @matrix = Array.new(rows) do |i|
        if default.is_a?(Array)
          default[i].size == @cols ? default[i].dup : (raise InvalidMatrixSize)
        else
          Array.new(cols, default)
        end
      end
    end

    def +(other)
      if other.is_a?(Matrix)
        add(other)
      elsif other.is_a?(Numeric)
        add_num(other)
      else
        raise InvalidMatrixOperation
      end
    end

    def *(other)
      if other.is_a?(Matrix)
        mul(other)
      elsif other.is_a?(Numeric)
        mul_by(other)
      else
        raise InvalidMatrixOperation
      end
    end

    def ==(other)
      @matrix == other.matrix
    end

    def !=(other)
      @matrix != other.matrix
    end

    def [](key)
      @matrix[key]
    end

    def []=(key, value)
      row = @matrix[key]
      value.each_with_index { |col, i| row[i] = col }
    end

    private

    def for_each
      return unless block_given?

      @matrix.each_with_index do |row, x|
        row.each_with_index { |col, y| yield(x, y, col) }
      end
    end

    def add(other)
      raise InvalidMatrixSize if @rows != other.rows || @cols != other.cols

      result = Matrix.new(@rows, @cols)
      for_each { |x, y, val| result[x][y] = val + other[x][y] }
      result
    end

    def add_num(value)
      result = Matrix.new(@rows, @cols)
      for_each { |x, y, val| result[x][y] = val + value }
      result
    end

    def mul(other)
      raise InvalidMatrixSize if @cols != other.rows

      result = Matrix.new(@rows, @cols)
      for_each do |x, y, val|
        @cols.times { |k| result[x][k] += val * other[y][k] }
      end
      result
    end

    def mul_by(value)
      result = Matrix.new(@rows, @cols)
      for_each { |x, y, val| result[x][y] = val * value }
      result
    end
  end
end
