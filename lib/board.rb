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

  # winning condition
  # this occurs when there is a lineup of four of the same piece
  # whether vertically, horizontally or diagonally
end
