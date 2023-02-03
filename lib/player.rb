# frozen_string_literal: false

# require 'pieces'
# require 'board'

# player creator
class Player
  attr_accessor :color_piece
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def move
    gets.chomp.to_i - 1
  end

  def choose_piece(color)
    piece = Pieces.new
    case color
    when 'black'
      @color_piece = piece.option(color)
    when 'white'
      @color_piece = piece.option(color)
    else
      puts 'please  choose the right color'
    end
    "Your piece is #{@color_piece}"
  end

  def insert_col(board, col)
    if board.slot_available?(col)
      row = board.levels_available(col) - 1
      board.board[row][col] = @color_piece
    end
    # board.layout
  end
end
