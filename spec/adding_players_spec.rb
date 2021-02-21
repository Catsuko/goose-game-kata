require 'spec_helper'

RSpec.describe Goose::Game do
  describe 'adding players' do
    let(:player_names) { %w[Pippo Pluto] }

    context 'when there are no participants' do
      it 'responds with the added player' do
        player_names.each do |name|
          game = described_class.new
          expect(game.update("add player #{name}")).to eq "players: #{name}"
        end
      end
    end

    context 'when there is one participant' do
      let(:game) { described_class.new }
      let(:player_name) { 'Pluto' }

      before { game.update("add player #{player_names.first}") }

      it 'responds with the added players' do
        name = player_names.last
        expect(game.update("add player #{name}")).to eq "players: #{player_names.join(', ')}"
      end
    end

    context 'when the player is already added' do
      let(:game) { described_class.new }
      let(:player_name) { player_names.first }

      before { game.update("add player #{player_name}") }

      it 'responds with duplicate player message' do
        expect(game.update("add player #{player_name}")).to eq "#{player_name}: already existing player"
      end

      it 'player is not added twice' do
        game.update("add player #{player_name}")
        response = game.update("add player #{player_names.last}")
        expect(response.scan(/#{player_name}/).size).to eq 1
      end
    end
  end
end