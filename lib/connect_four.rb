# frozen_string_literal: true

require 'colorize'
require_relative '../lib/player'
require_relative '../lib/computer'

# board class for connect four
class Board
  attr_accessor :board

  def initialize(sqr = '⬛')
    @board = { 1 => [sqr, sqr, sqr, sqr],
               2 => [sqr, sqr, sqr, sqr],
               3 => [sqr, sqr, sqr, sqr],
               4 => [sqr, sqr, sqr, sqr] }
    @turn = 0
    @computer = Computer.new('Terminator')
  end

  def display
    board.each_value { |row| puts row.join }
  end

  def win_conditions
    board.each_value { |row| return true if row.all?('X') }
  end
end
