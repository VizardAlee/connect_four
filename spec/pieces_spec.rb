# frozen_string_literal: false

require './lib/pieces'

describe Pieces do
  describe '#piece_options' do
    it 'provides options for pieces to be chosen' do
      chip = Pieces.new
      expect(chip.option('black')).to eq("\u{25A0}")
    end
  end
end
