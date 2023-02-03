# frozen_string_literal: false

# pieces class
class Pieces
  attr_accessor :piece

  def initialize
    @piece = nil
  end

  def option(color)
    case color
    when 'black'
      @piece = "\u{25A0}"
    when 'white'
      @piece = "\u{25A1}"
    else
      puts "#{color} is not a valid option"
    end
    @piece
  end
end
