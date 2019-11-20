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
