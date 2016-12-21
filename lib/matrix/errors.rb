module Matrix
  class MatrixError < StandardError
  end

  class InvalidMatrixSize < MatrixError
  end

  class InvalidMatrixOperation < MatrixError
  end
end
