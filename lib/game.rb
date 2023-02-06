# frozen_string_literal: false

# putting everything together in game class
class Game
  attr_accessor :board, :player1, :player2, :mover

  def initialize
    @board = Board.new
    @mover = ''
  end

  # prompt players to choose pieces
  # --if player 1 takes a piece, player 2 takes the other
  # display board
  # prompt player 1 to make a move
  # player 2 takes the next turn
  # declare draw if board is full and no win conditions met
  # if win conditions met, declare winner and end game.

  def create_player
    puts 'Please insert your name, player 1'
    @player1 = Player.new(gets.chomp)
    puts 'Please insert your name, player 2'
    @player2 = Player.new(gets.chomp)
    puts "#{@player1.name} VS #{player2.name}"
    puts "Let's Goooo!!"
  end

  def choose_piece
    puts "Choose your color #{player1.name}:"
    @player1.choose_piece(gets.chomp)
    case player1.color_piece
    when "\u{25A1}"
      @player2.choose_piece('black')
    when "\u{25A0}"
      @player2.choose_piece('white')
    end
    puts "#{player1.name}'s piece is #{player1.color_piece} and #{player2.name}'s piece is #{player2.color_piece}"
  end

  def player1_turn(col, board = @board, choice = [])
    @player1.insert_col(board, col)
    if board.column_full?(col)
      board.layout
      puts "Column '#{col + 1}' is full! Choose another column or loose your turn #{player2.name}"
      @mover = false
    else
      @mover = true
      board.layout
    end
  end

  def player2_turn(col, board = @board, choice = [])
    @player2.insert_col(board, col)

    if board.column_full?(col)
      board.layout
      puts "Column '#{col + 1}' is full! Choose another column or loose your turn #{player1.name}"
      @mover = true
    else
      @mover = false
      board.layout
    end
  end

  def p1_move(col = player1.move, color = player1.color_piece, choice = [])
    choice << col
    col = choice.join.to_i
    return 'Woo' if board.check_win(col, color)

    player1_turn(col)
  end

  def p2_move(col = player2.move, color = player2.color_piece, choice = [])
    choice << col
    col = choice.join.to_i
    return 'Win!' if board.check_win(col, color)

    player2_turn(col)
  end

  def turn(board = @board)
    until board.board_full?
      puts "Make a move #{player1.name}"
      return "#{player1.name} Wins" if p1_move(player1.move) == 'Woo'

      puts "Make a move #{player2.name}"
      return "#{player2.name} Wins" if p2_move(player2.move) == 'Win!'
    end
    puts 'Game Over'
  end
end
