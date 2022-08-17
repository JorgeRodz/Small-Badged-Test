# frozen_string_literal: true

# Clase celula
class Cell
  attr_reader :status

  def initialize
    @type = ['*', '.']
    @status = @type[rand(2)]
  end
end

# Clase tablero
class Grid
  attr_accessor :grid, :row, :col

  def initialize(row, col)
    @row = row
    @col = col
    @grid = Array.new(@row) { Array.new(@col) { Cell.new } }
  end

  def print_grid
    @row.times do |i|
      @col.times do |j|
        print @grid[i][j].status
      end
      puts
    end
    @grid
  end
end

class Game
  attr_accessor
  def initialize(grid)
    @row = grid.size
    @col = grid[0].size
    @grid = grid
    @new_grid = grid
  end

  # Recorre toda el grid
  def run_matrix
    p 'nueva matrix'
    counter = 0
    (0..@row - 1).each do |i|
      (0..@col - 1).each do |j|
        counter = neighbors(i, j).to_i
        print rules(i, j, counter, @grid[i][j].status)
      end
      puts
    end
  end

  # Recorre los vecinos recibiendo una celda
  def neighbors(posx, posy)
    neighbors = 0

    # Recorre los vecinos
    (-1..1).each do |k|
      (-1..1).each do |l|
        if !(k.zero? && l.zero?) && (posx + k >= 0 && posy + l >= 0) && (posx + k < @row && posy + l < @col)
          @grid[posx + k][posy + l].status == "*" ? neighbors += 1 : neighbors += 0
        end
      end
    end
    neighbors
  end

  def rules(_pos_x, _pos_y, neighbors, status)
    result_cell = '.'

    if status == '*' && (neighbors < 2 || neighbors > 3)
      result_cell = '.'
    elsif status == '*' && neighbors >= 2 || status == '.' && neighbors == 3
      result_cell = '*'
    end
    result_cell
  end
end

print 'Ingrese el numero de filas: '
row = gets.chomp.to_i

print 'Ingrese el numero de columnas: '
col = gets.chomp.to_i

grid = Grid.new(row, col)
grid = grid.print_grid

game = Game.new(grid)
game.run_matrix
