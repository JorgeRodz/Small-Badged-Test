class Grid

    def initialize (row, col)
        @row = row
        @col = col
        @grid = Array.new(@row){Array.new(@col) {'.'}}

    end

    def print_grid 
        @row.times do |i|
            @col.times do |j|
                print @grid [i][j] + ' '
            end
            puts
        end    
    end


end

puts 'Ingrese el numero de filas'
row = gets.chomp.to_i

puts 'Ingrese el numero de columnas'
col = gets.chomp.to_i

grid = Grid.new(row, col)
grid.print_grid