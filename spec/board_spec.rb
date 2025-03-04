require_relative '../lib/board'
require_relative '../lib/tile'

describe Board do
  describe 'when tile is changed' do
    subject(:sample_board) {described_class.new()}
    context 'Player puts X in column 1' do
      it 'display updates column 1' do
        symbol = "X"
        column = 1
        sample_board.insert_symbol(symbol,column)
        expect(sample_board.tiles[column-1][0].display).to eq(symbol)
      end
    end

    context 'Player puts O on top of X in column 1' do
      it 'display updates column 1' do
        symbol = "X"
        column = 1
        symbol2 = "O"
        sample_board.insert_symbol(symbol,column)
        sample_board.insert_symbol(symbol2,column)
        expect(sample_board.tiles[column-1][1].display).to eq(symbol2)
      end
    end

    context 'Player puts O beside of X in column 2' do
      it 'display updates column 2' do
        symbol = "X"
        column = 1
        symbol2 = "O"
        column2 = 2
        sample_board.insert_symbol(symbol,column)
        sample_board.insert_symbol(symbol2,column2)
        expect(sample_board.tiles[column2-1][0].display).to eq(symbol2)
      end
    end




  end

  


end