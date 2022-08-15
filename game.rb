# frozen_string_literal: true
# Clase celula
class Cell
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
    
end

print 'Ingrese el numero de filas: '
row = gets.chomp.to_i

print 'Ingrese el numero de columnas: '
col = gets.chomp.to_i

grid = Grid.new(row, col)
grid.print_grid