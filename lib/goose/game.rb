module Goose
  class Game
    def initialize
      @players = []
    end

    def update(input)
      if input.start_with?("add player ")
        add_player(input)
      else
        move_player(input)
      end
    end

    def add_player(input)
      player_name = input.delete_prefix("add player ")

      if @players.include?(player_name)
        "#{player_name}: already existing player"
      else
        @players << player_name
        "players: #{@players.join(', ')}"
      end
    end

    def move_player(input)
      player = @players.find { |name| input.include?(name) }
      numbers = input.scan(/\d/).map(&:to_i)
      "#{player} rolls #{numbers.join(', ')}. #{player} moves from Start to #{numbers.inject(:+)}"
    end
  end
end