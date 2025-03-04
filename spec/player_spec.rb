require_relative '../lib/player'

describe Player do

  subject(:firstplayer) {described_class.new()}

  context 'when player is created' do
    it 'doesnt have a symbol' do
      expect(firstplayer.symbol).to be_nil
    end
  end

  describe '#set_symbol' do
    context 'when player sets symbol to O' do
      it 'updates symbol' do
        input = 'O'
        allow(firstplayer).to receive(:gets).and_return(input)
        firstplayer.set_symbol
        expect(firstplayer.symbol).to eq(input)
      end
    end
    context 'when player sets symbol to X' do
      it 'updates symbol' do
        input = 'X'
        allow(firstplayer).to receive(:gets).and_return(input)
        firstplayer.set_symbol
        expect(firstplayer.symbol).to eq(input)
      end
    end
    context 'when player tries to set symbol to XO then X' do
      it 'rejects first input, loops, accepts second input' do
        input = 'XO'
        input2 = 'X'
        allow(firstplayer).to receive(:gets).and_return(input, input2)
        output = <<~OUTPUT
          What symbol would you like to use? Type it below:
          Symbols must be 1 character. Please try again.
          What symbol would you like to use? Type it below:
        OUTPUT
        expect{firstplayer.set_symbol}.to output(output).to_stdout
      end
    end
  end
end