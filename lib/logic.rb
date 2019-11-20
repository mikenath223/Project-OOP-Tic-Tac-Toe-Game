# frozen_string_literal: true

module TicTacToe
  class Board
    attr_reader :grid

    def initialize(input = {})
      @grid = input.fetch(:grid, grid_default)
    end

    def find_cell(cord_x, cord_y)
      grid[cord_y][cord_x]
    end

    def set_cell(cord_x, cord_y, val)
      find_cell(cord_x, cord_y).val = val
    end

    def game_over
      return :winner if winner?
      return :draw if draw?

      false
    end

    def format_grid
      grid.each do |row|
        row.map { |cell| cell.value.empty? ? '| _ |' : "| #{cell.value} |" }.join(' ')
      end
    end

    private

    def grid_default
      [[Cell.new], [Cell.new], [Cell.new]]
    end

    def draw?
      grid.flatten.map(&:value).none_empty?
    end

    def winner?
      win_positions.each do |win_pos|
        next if win_pos_vals(win_pos).all_empty?
        return true if win_pos_vals(win_pos).all_same?
      end
      false
    end

    def win_pos_vals(win_pos)
      win_pos.map(&:value)
    end

    def win_positions
      grid
      grid.transpose
      diagonals
    end

    def diagonals
      [
        [find_cell(0, 0), find_cell(1, 1), find_cell(2, 2)],
        [find_cell(0, 2), find_cell(1, 1), find_cell(2, 0)]
      ]
    end
  end

  class Cell
    attr_accessor :value
    def initialize(value = '')
      @value = value
    end
  end

  class Game
    attr_reader :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.switch
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def ask_move
      "#{current_player.name}: Enter a number between 1 and 9 to make your move"
    end

    def get_move(human_move = gets.chomp)
      human_move_to_cord(human_move)
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return 'The game ended in a draw' if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} has randomly been selected as first player"
      loop do
        board.format_grid
        puts ''
        puts ask_move
        cord_x, cord_y = get_move
        board.set_cell(cord_x, cord_y, current_player.pick)
        if board.game_over
          puts game_over_message
          board.format_grid
          return
        else
          switch_players
        end
      end
    end

    private

    def human_move_to_cord(human_move)
      mapping = {
        '1' => [0, 0],
        '2' => [1, 0],
        '3' => [2, 0],
        '4' => [0, 1],
        '5' => [1, 1],
        '6' => [2, 1],
        '7' => [0, 2],
        '8' => [1, 2],
        '9' => [2, 2]
      }
      mapping[human_move]
    end
  end

  # class Player
  #   attr_reader :pick, :name
  #   def initialize(input)
  #     @pick = input.fetch(:pick)
  #     @name = input.fetch(:name)
  #   end
  # end
end

class Array
  def all_empty?
    all? { |elem| elem.to_s.empty? }
  end

  def all_same?
    all? { |elem| elem == self[0] }
  end

  def any_empty?
    any? { |elem| elem.to_s.empty? }
  end

  def none_empty?
    !any_empty?
  end
end
