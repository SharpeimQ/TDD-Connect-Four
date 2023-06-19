# frozen_string_literal: true

require 'colorize'

# the computer in connect four
class Computer
  attr_accessor :token, :name

  def initialize(name, token = '⬛'.colorize(:red))
    @name = name
    @token = token
  end

  def generate_move
    rand(1..4)
  end
end
