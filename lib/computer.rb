# frozen_string_literal: true

# the computer in connect four
class Computer
  attr_accessor :token
  
  def initialize(name, token = '⬛'.colorize(:red))
    @name = name
    @token = token
  end
end
