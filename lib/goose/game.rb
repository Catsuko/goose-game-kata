module Goose
  class Game

    COMMANDS = {
      add_player: 'add player '
    }.freeze

    def initialize
      @players = []
    end

    def update(input)
      player_name = input.delete_prefix(COMMANDS.fetch(:add_player))

      if @players.include?(player_name)
        "#{player_name}: already existing player"
      else
        @players << player_name
        "players: #{@players.join(', ')}"
      end
    end
  end
end