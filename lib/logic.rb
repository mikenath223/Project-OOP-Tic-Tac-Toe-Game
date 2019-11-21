# frozen_string_literal: true

module TicTacToe
  class Game
    attr_accessor :player1, :player2, :board
    def initialize(first_player, second_player)
      @player1 = first_player
      @player2 = second_player
      @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end

    def find_cell(cord_x, cord_y, move = nil)
      @board[cord_y][cord_x] = move
    end

    def get_move(human_move, move)
      map_move = human_move_to_cord(human_move)
      find_cell(map_move[0], map_move[1], move)
    end

    def game_over?
      return true if winner?

      false
    end

    def print_grid
      @board.map do |row|
        row.map { |cell| "| #{cell} |" }.join
      end
    end

    def grid_default
      @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end

    private

    def winner?
      win_positions.each do |win_pos|
        return true if win_pos.each { |elem| true if elem.uniq.count == 1 }
      end
      false
    end

    def win_positions
      [@board, verticals, diagonals]
    end

    def diagonals
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]
    end

    def verticals
      [
        [get_cell(0,0), get_cell(1,0), get_cell(2,0)],
        [get_cell(0,1), get_cell(1,1), get_cell(2,1)],
        [get_cell(0,2), get_cell(1,2), get_cell(2,2)]

      ]
    end

    def get_cell(cord_x, cord_y)
      @board[cord_y][cord_x]
    end

    def human_move_to_cord(human_move)
      mapping = {
        1 => [0, 0],
        2 => [1, 0],
        3 => [2, 0],
        4 => [0, 1],
        5 => [1, 1],
        6 => [2, 1],
        7 => [0, 2],
        8 => [1, 2],
        9 => [2, 2]
      }
      mapping[human_move]
    end
  end
end
