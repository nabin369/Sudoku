require_relative '../lib/cell'

describe 'Cell' do 

	# let(grid) { double :grid }
	let(:cells) { Cell.new(:value) }

		it 'checks if its filled out or solved' do
			# cells = Cell.new(:value)

			# expect(grid).to receive(:solved?)
			# cells.filled_out?.to eq(grid.solved?)
			expect(cells).to be_filled_out
		end

	# it 'checks the possible candidates' do
	# 	expect(cells.candidates([2])).to eq([1,2])
	# end
	
end