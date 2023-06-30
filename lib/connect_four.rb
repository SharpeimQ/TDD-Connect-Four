# frozen_string_literal: true

require 'colorize'
require_relative '../lib/player'
require_relative '../lib/computer'

# board class for connect four
class Board
  attr_accessor :board, :player, :computer, :sqr

  def initialize(name, sqr = '⬛')
    @computer = Computer.new('Terminator')
    @player = Player.new(name)
    @board = { 1 => [sqr, sqr, sqr, sqr],
               2 => [sqr, sqr, sqr, sqr],
               3 => [sqr, sqr, sqr, sqr],
               4 => [sqr, sqr, sqr, sqr] }
    @sqr = sqr
    @turn = 0
    game
  end

  def display
    board.each_value { |row| puts row.join }
  end

  # methods for checking win condition
  def win_conditions
    return true if horizontal_win? || vertical_win? || diagonal_win?
  end

  def horizontal_win?
    board.each_value do |row|
      return true if horizontal_check(row)
    end
    false
  end

  def vertical_win?
    4.times do |col|
      column = board.values.map { |row| row[col] }
      return true if horizontal_check(column)
    end
    false
  end

  def diagonal_win?
    diag = []
    diag_two = []
    board.size.times do |i|
      diag << board[i + 1][i]
      diag_two << board[i + 1][board.size - 1 - i]
    end
    return true if horizontal_check(diag)
    return true if horizontal_check(diag_two)

    false
  end

  def horizontal_check(array)
    array.all?(player.token) || array.all?(computer.token)
  end

  # methods for updating the board
  def update_board(column, token)
    size = board.size
    4.times do |i|
      if board[size - i][column - 1] == sqr
        board[size - i][column - 1] = token
        break
      end
    end
  end

  # method for checking if a column is full
  def column_checker(column)
    board[1][column - 1] == sqr
  end

  def game
    puts 'Welcome to Connect Four!'
    display
    loop do
      puts 'Make your move!'
      if  
        move = player.make_move
      update(move)
      break if win_conditions
    end
  end

  def update(move)
    update_board(move, player.token)
    display
    puts
  end
end

Board.new('Sharpeim')
