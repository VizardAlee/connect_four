# frozen_string_literal: false

require './lib/board'

describe Board do
  context 'creates board' do
    it 'has 6 by seven dimensions' do
      board = Board.new
      expected = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', '']
      ]
      expect(board.board).to eql(expected)
    end
  end

  describe '#column_full?' do
    board = Board.new

    it 'returns true if column is full' do
      board.board[0] = ['X', '', '', '', '', '', '']
      board.board[1] = ['X', '', '', '', '', '', '']
      board.board[2] = ['X', '', '', '', '', '', '']
      board.board[3] = ['X', '', '', '', '', '', '']
      board.board[4] = ['X', '', '', '', '', '', '']
      board.board[5] = ['X', '', '', '', '', '', '']
      expect(board.column_full?(0)).to be true
    end
  end

  describe '#levels_available' do
    board = Board.new

    it 'returns number of rows available in a column' do
      board.board = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['X', '', '', '', '', '', '']
      ]
      expect(board.levels_available(0)).to be(5)
    end
  end
end
