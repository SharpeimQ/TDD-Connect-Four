# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/computer'
require 'colorize'

# board class for connect four
class Board
  attr_accessor :row_one, :row_two, :row_three, :row_four, :board

  def initialize(sqr = '⬛')
    @row_one = [sqr, sqr, sqr, sqr]
    @row_two = [sqr, sqr, sqr, sqr]
    @row_three = [sqr, sqr, sqr, sqr]
    @row_four = [sqr, sqr, sqr, sqr]
    @turn = 0
    @board = [row_one, row_two, row_three, row_four]
    @computer = Computer.new('Terminator')
  end

  def display
    board.each { |row| puts row.join }
  end


end

game = Board.new
game.display
