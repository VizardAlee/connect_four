# frozen_string_literal: false

# board class
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, '') }
  end

  def column_full?(col)
    column = @board.map { |row| row[col] }
    column.none?(&:empty?)
  end

  def levels_available(col, open_spots = [])
    board.map { |row| open_spots << board.index(row[col]) if row[col] == '' }
    open_spots.map { |val| 1 if val.nil? }.inject { |sum, val| sum + val }
  end

  def slot_available?(col)
    return true unless levels_available(col).nil? || levels_available(col) == 0
  end

  def board_full?
    cols = []
    @board.each do |row|
      row.each do |col|
        cols << col.empty?
      end
    end
    cols.none? == true
  end

  def layout
    puts "| #{board[0][0]} | #{board[0][1]} | #{board[0][2]} | #{board[0][3]} | #{board[0][4]} | #{board[0][5]} | #{board[0][6]} |"
    puts '-----+----+----+----+----+----+-----'
    puts "| #{board[1][0]} | #{board[1][1]} | #{board[1][2]} | #{board[1][3]} | #{board[1][4]} | #{board[1][5]} | #{board[1][6]} |"
    puts '-----+----+----+----+----+----+-----'
    puts "| #{board[2][0]} | #{board[2][1]} | #{board[2][2]} | #{board[2][3]} | #{board[2][4]} | #{board[2][5]} | #{board[2][6]} |"
    puts '-----+----+----+----+----+----+-----'
    puts "| #{board[3][0]} | #{board[3][1]} | #{board[3][2]} | #{board[3][3]} | #{board[3][4]} | #{board[3][5]} | #{board[3][6]} |"
    puts '-----+----+----+----+----+----+-----'
    puts "| #{board[4][0]} | #{board[4][1]} | #{board[4][2]} | #{board[4][3]} | #{board[4][4]} | #{board[4][5]} | #{board[4][6]} |"
    puts '-----+----+----+----+----+----+-----'
    puts "| #{board[5][0]} | #{board[5][1]} | #{board[5][2]} | #{board[5][3]} | #{board[5][4]} | #{board[5][5]} | #{board[5][6]} |"
    puts '------------------------------------'
  end

  # check if there are four consecutive pieces of the same color in a row
  def check_row(color = 'X', board = @board, length = @board.length - 1)
    return false if length.negative?

    section = board[length]
    tester = section.each_cons(4).any? { |group| group.all?(color) }
    return true if tester == true

    check_row(color, board, length - 1)
  end

  # check if there are four consecutive pieces of the same color in a column
  def check_column(col, color)
    column = @board.map { |row| row[col] }
    if column.each_cons(4).any? { |group| group.all?(color) }
      return true
    else
      return false
    end
  end

  def check_win(col, color)
    if check_row(color) == true
      return true
    elsif check_column(col, color) == true
      return true
    else
      false
    end
    # return true if check_diagonal(col, color)
  end
end
