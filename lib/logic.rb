# frozen_string_literal: true

module TicTacToe
  class Game
    attr_accessor :player1, :player2, :board
    def initialize(first_player, second_player)
      @player1 = [first_player, 'X']
      @player2 = [second_player, 'O']
      @board = [[nil,nil,nil], [nil,nil,nil], [nil,nil,nil]]
    end

    def find_cell(cord_x, cord_y, player)
      if player == player1
        val = @player1[1]
      else
        val = @player2[1]
      end
      @board[cord_y][cord_x] = val
    end

    def get_move(human_move, player)
      map_move = human_move_to_cord(human_move)
      find_cell(map_move[0], map_move[1], player)
    end
    
    def game_over?
      return :winner if winner?
      return :draw if draw?

      false
    end

    def print_grid
      @board.map do |row|
         rows = row.map { |cell| cell.nil? ? '| _ |' : "| #{cell} |" }.join()
      end
    end

    def grid_default
      @board = [[nil,nil,nil], [nil,nil,nil], [nil,nil,nil]]
    end

    private

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
