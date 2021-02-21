require 'spec_helper'

RSpec.describe Goose::Game do
  describe 'moving' do
    let(:player_names) { %w[Pippo Pluto] }
    let(:game) do
      Goose::Game.new.tap do |new_game| 
        player_names.each { |name| new_game.update("add player #{name}") }
      end
    end

    context 'when there are two participants at the start' do
      it 'Pippo moves to square 6' do
        name = player_names.first
        expect(game.update("move #{name} 4, 2")).to eq "#{name} rolls 4, 2. #{name} moves from Start to 6"
      end

      it 'Pluto moves to square 4' do
        name = player_names.last
        expect(game.update("move #{name} 2, 2")).to eq "#{name} rolls 2, 2. #{name} moves from Start to 4"
      end
    end
  end
end