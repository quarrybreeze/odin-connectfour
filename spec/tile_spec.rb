require_relative '../lib/tile'

describe Tile do
  describe 'when symbol is placed' do
    subject(:tile) {described_class.new()}
    

    context 'and no symbol in tile' do
      it 'sets the tile to display X symbol' do
        symbol = "X"
        tile.display_symbol(symbol)
        expect(tile.display).to eq(symbol)
      end
    end

  end
end