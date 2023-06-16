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
    return true if horizontal_win?
    return true if vertical_win?
    return true if diagonal_win?
  end

  def horizontal_win?
    board.each_value do |row|
      return true if row.all?(player.token) || row.all?(computer.token)
    end
    false
  end

  def vertical_win?
    3.times do |col|
      column = board.values.map { |row| row[col] }
      return true if column.all?(player.token) || column.all?(computer.token)
    end
    false
  end
end

game = Board.new('Sharpeim')
game.display
