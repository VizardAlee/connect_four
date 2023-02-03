# frozen_string_literal: false

require './lib/player'
require './lib/board'
describe Player do
  describe '#player_names' do
    it 'creates players with their names' do
      player = Player.new('Aliyu')
      expect(player.name).to eq('Aliyu')
    end
  end

  describe '#choose_piece' do
    it 'chooses the preferred piece for the player' do
      player = Player.new('Aliyu')
      expect(player.choose_piece('black')).to eq('Your piece is ■')
    end
  end

  describe '#insert_col' do
    it 'inserts piece into columns' do
      player = Player.new('Aliyu')
      board = Board.new
      board.board = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['■', '', '', '', '', '', '']
      ]
      expect(player.insert_col(board, 0)).to eq(
        [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['■', '', '', '', '', '', ''],
          ['■', '', '', '', '', '', '']
        ]
      )
    end
  end
end
