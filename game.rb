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
        @grid
    end

end

class Game
    def initialize(grid)
        @row = grid.size
        @col = grid[0].size
        @grid = grid
    end

    #Recorre toda el grid
    def run_matrix
        p 'nueva matrix'
        neighbors(2,1)

        # (0..@row - 1).each do |i|
        #     (0..@col - 1).each do |j|
        #         print @grid[i][j].status, ' '
        #         neighbors(i,j)
        #     end
        #     puts
        # end
    end
    #Recorre los vecinos recibiendo una celda
        # ...
        # .*.
        # ...
          #####
        # #*..
        # #...
        # #...
    def neighbors(posx,posy)
        neighbors = 0

        #posx = 2
        #posy = 0
        #k = -1
        #l = -1

        # 
        # . . .
        # . . .
        # . . .

        #Recorre los vecinos
        (-1..1).each do |k|
            (-1..1).each do |l|
                if !(k == 0 && l == 0) && (posx + k >= 0 && posy + l >= 0) && (posy + k <= @row - 1 && posx + l <= @col -1) #posx + k >= 0 && posy + l >= 0
                    print @grid[posx + k][posy + l].status + ' '
                    neighbors += 1
                end
            end
            puts ''
        end
        puts neighbors
    end
end


print 'Ingrese el numero de filas: '
row = gets.chomp.to_i

print 'Ingrese el numero de columnas: '
col = gets.chomp.to_i

grid = Grid.new(row, col)
grid = grid.print_grid

game= Game.new(grid)
game.run_matrix
