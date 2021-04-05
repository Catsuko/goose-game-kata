module Goose
  class Game
    def initialize(board={})
      @board = board
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

      if players.include?(player_name)
        "#{player_name}: already existing player"
      else
        @board.store(player_name, 0)
        "players: #{players.join(', ')}"
      end
    end

    def move_player(input)
      player = players.find { |name| input.include?(name) }
      numbers = input.scan(/\d/).map(&:to_i)
      previous_position = @board[player]
      @board.store(player, previous_position + numbers.inject(:+))
      describe_roll(player, numbers) + describe_move(player, previous_position) + describe_outcome(player)
    end

  private

    def players
      @board.keys
    end

    def describe_position(n)
      n.zero? ? 'Start' : n
    end

    def describe_roll(player, numbers)
      "#{player} rolls #{numbers.join(', ')}. "
    end

    def describe_move(player, previous_position)
      "#{player} moves from #{describe_position(previous_position)} to #{describe_position(@board[player])}"
    end

    def describe_outcome(player)
      @board[player] == 63 ? ". #{player} Wins!!" : ''
    end
  end
end