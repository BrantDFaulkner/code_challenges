module Matrix

  def lines(matrix)
    [rows(matrix), columns(matrix), diagonals(matrix)].flatten(1)
  end

  def winning_line?(line)
    !line.include?(nil) && line.uniq.length == 1
  end

  private

  def rows(matrix)
    matrix
  end

  def columns(matrix)
    matrix.transpose
  end

  def diagonals(matrix)
    matrices = [matrix, matrix.map(&:reverse)]
    matrices.map do |matrix|
      matrix.map.with_index { |row, i| row[i] }
    end
  end

end#Matrix