# frozen_string_literal: true
# Clase celula
class Cell
    attr_reader :status
    def initialize
        @type = ['*','.']
        @status = @type[rand(2)]
    end

    def change_s
        status ? '*' : '.'
    end
end

# Clase tablero
class Grid
    attr_accessor :grid, :row, :col

    def initialize (row, col)
        @row = row
        @col = col
        @grid = Array.new(@row){Array.new(@col) {Cell.new}}

    end

    def print_grid 
        @row.times do |i|
            @col.times do |j|
                print @grid[i][j].status + ' '
            end
            puts
        end    
    end

end

class Game
    def initialize(grid)
        @row = grid.length
        @col = grid[0].length

    end
    
    def grid_values
        puts "Número de filas: #{@row} número de cols: #{@col}" 
    end
end  
    #Recorre toda el grid
    # def run_matrix
    #     (0..@row).each do |i|
    #         (0..@col).each do |j|
    #         end
    #     end              
    # end
    #Recorre los vecinos recibiendo una celda



print 'Ingrese el numero de filas: '
row = gets.chomp.to_i

print 'Ingrese el numero de columnas: '
col = gets.chomp.to_i

grid = Grid.new(row, col)
grid.print_grid

game= Game.new(grid)
game.grid_values
        