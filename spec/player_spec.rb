# frozen_string_literal: true

require_relative '../lib/connect_four'
require_relative '../lib/player'
require_relative '../lib/computer'

describe Player do
  describe 'name_checker' do
    context 'names should have no spaces' do
      subject(:player) { described_class.new('default') }
      invalid_name = 'Ronald McDonald'
      invalid_name_two = 'Walter White'
      valid_name = 'Sharpeim'

      before do
        allow(player).to receive(:gets).and_return(invalid_name, invalid_name_two, valid_name)
      end

      it 'loops until a valid name is inputted' do
        player.name_checker(invalid_name)
        player.name_checker(invalid_name_two)

        expect(player.name_checker(valid_name)).to be('Sharpeim')
      end
    end
  end
end
