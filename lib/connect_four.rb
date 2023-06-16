# frozen_string_literal: true

require 'colorize'
require_relative '../lib/player'
require_relative '../lib/computer'

# board class for connect four
class Board
  attr_accessor :board, :player, :computer

  def initialize(name, sqr = '⬛')
    @computer = Computer.new('Terminator')
    @player = Player.new(name)
    @board = { 1 => [sqr, sqr, sqr, sqr],
               2 => [sqr, sqr, sqr, sqr],
               3 => [sqr, sqr, sqr, sqr],
               4 => [sqr, sqr, sqr, sqr] }
    @turn = 0
  end

  def display
    board.each_value { |row| puts row.join }
  end

  def win_conditions
    board.each_value do |row|
      return true if row.all?(player.token) || row.all?(computer.token)

      false
    end
  end
end

game = Board.new('Sharpeim')
game.display
