# frozen_string_literal: true

# player class for connect four
class Player
  attr_accessor :token
  
  def initialize(name, token = '⬛'.colorize(:blue))
    @name = name
    @token = token
  end
end
