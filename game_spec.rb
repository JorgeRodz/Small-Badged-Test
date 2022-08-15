require 'rspec'
require_relative './game.rb'

# Evaluar existencia de una celula en el tablero
# Evaluar dimensiones del tablero
# Evaluar estado de una celula

describe Grid do
    describe 'print_grid' do
        it 'return an array with rows and cols' do
            expect(Grid.new(5,5)).not_to eql(nil)
        end    
    end    
end

