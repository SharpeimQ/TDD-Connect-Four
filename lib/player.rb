# frozen_string_literal: true

require 'colorize'

# player class for connect four
class Player
  attr_accessor :token, :name

  def initialize(name, token = '⬛'.colorize(:blue))
    @name = name_checker(name)
    @token = token
  end

  # methods for verifying names
  def name_checker(name)
    return name if valid_name?(name)

    loop do
      puts 'Invalid name. Try again:'
      name = gets.chomp
      return name if valid_name?(name)
    end
  end

  def valid_name?(name)
    name.match(/^[A-Za-z]+$/) && name.length <= 10
  end

  # methods for verifying moves
  def make_move
    move = gets.chomp.to_i
    move_check(move)
  end

  def move_checker(move)
    if move.between?(1, 4)
      move
    else
      loop do
        puts 'Invalid move. Try again:'
        move = gets.chomp.to_i
        return move if move.between?(1, 4)
      end
    end
    move
  end
end
