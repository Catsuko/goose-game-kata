require 'spec_helper'

RSpec.describe Goose::Game do
  describe 'moving' do
    let(:player_names) { %w[Pippo Pluto] }
    let(:game) do
      Goose::Game.new.tap do |new_game| 
        player_names.each { |name| new_game.update("add player #{name}") }
      end
    end

    context 'from start' do
      it 'Pippo moves to square 6' do
        name = player_names.first
        expect(game.update("move #{name} 4, 2")).to eq "#{name} rolls 4, 2. #{name} moves from Start to 6"
      end

      it 'Pluto moves to square 4' do
        name = player_names.last
        expect(game.update("move #{name} 2, 2")).to eq "#{name} rolls 2, 2. #{name} moves from Start to 4"
      end
    end

    context 'from square 6' do
      let(:name) { player_names.first }

      it 'Pippo moves to square 11' do
        game.update("move #{name} 4, 2")
        expect(game.update("move #{name} 3, 2")).to eq "#{name} rolls 3, 2. #{name} moves from 6 to 11"
      end
    end
  end
end