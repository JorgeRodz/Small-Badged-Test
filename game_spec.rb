require 'rspec'
require_relative './game.rb'

describe Grid do
    describe 'print_grid' do
        it 'return an array with rows and cols' do
            expect(Grid.new(5,5)).not_to eql(nil)
        end    
    end    
end

