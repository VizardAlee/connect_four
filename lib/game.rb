# frozen_string_literal: false

# putting everything together in game class
class Game
  attr_accessor :board, :player1, :player2, :mover, :over

  def initialize
    @board = Board.new
    @mover = ''
    @over = false
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
    @player1.choose_piece(gets.chomp.downcase)
    case player1.color_piece
    when "\u{25A1}"
      @player2.choose_piece('black')
    when "\u{25A0}"
      @player2.choose_piece('white')
    else
      puts "Please choose 'Black' or 'White'"
      choose_piece
    end
  end

  def player1_turn(col, board = @board, color = player1.color_piece)
    @player1.insert_col(board, col)
    if board.column_full?(col)
      puts "Column '#{col + 1}' is full! Choose another column or loose your turn #{player2.name}"
    end
    board.layout
    return 'Win!' if board.check_win(col, color)
  end

  def player2_turn(col, board = @board, color = player2.color_piece)
    @player2.insert_col(board, col)
    if board.column_full?(col)
      puts "Column '#{col + 1}' is full! Choose another column or loose your turn #{player1.name}"
    end
    board.layout
    return 'Win!' if board.check_win(col, color)
  end

  def p1_move(col = player1.move, choice = [])
    begin
      choice << col
      col = choice.join.to_i

      return @over = true if player1_turn(col) == 'Win!'
    rescue
      puts 'Please put in the right column number!'
      p1_move
    end
  end

  def p2_move(col = player2.move, choice = [])
    begin
      choice << col
      col = choice.join.to_i

      return @over = true if player2_turn(col) == 'Win!'
    rescue
      puts 'Please put in the right column number!'
      p2_move
    end
  end

  def turn(board = @board)
    until @over == true || board.board_full?
      unless @mover == true
        puts "Make a move #{player1.name}"
        p1_move
        @mover = true
        if @over == true
          puts "#{player1.name} Wins!"
          return
        end
      end

      unless @mover == false
        puts "Make a move #{player2.name}"
        p2_move
        @mover = false
        if @over == true
          puts "#{player2.name} Wins!"
          return
        end
      end
    end
    puts 'Game over!'
  end

  def play
    puts 'WELCOME TO CONNECT FOUR!!'
    create_player
    choose_piece
    puts "#{player1.name}'s piece is #{player1.color_piece} and #{player2.name}'s piece is #{player2.color_piece}"
    turn
    puts 'Game Over!'
  end
end
