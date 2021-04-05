require 'spec_helper'

RSpec.describe Goose::Game do
  describe 'victory' do
    let(:player_names) { %w[Pippo Pluto] }
    let(:game) { Goose::Game.new(player_names.to_h { |p| [p, 60] }) }

    context 'when landing on space 63' do
      it 'Pippo wins the game' do
        name = player_names.first
        expect(game.update("move #{name} 1, 2")).to eq "#{name} rolls 1, 2. Pippo moves from 60 to 63. Pippo Wins!!"
      end
    end
  end
end
