require_relative '../lib/grid'

describe 'Grid' do 

		let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'} # it's an easy sudoku puzzle, row by row }
		let(:grid) { Grid.new(puzzle)}

	context "initialization" do


		it 'should have 81 cells' do
			expect{grid}.not_to raise_error
		end

		it 'should have an unsolved first cell' do
			expect(grid.cells.first.value).to eq(0)
	  end

	  it 'should have a solved second cell with value 1' do
			expect(grid.cells[1].value).to be(1)
	  end

	  it 'should return false if the cells is not solved' do
	  	expect(grid.solved?).to be_false
	  end	  

	end

	context "solving sudoku" do

		it 'can solve the puzzle' do
			expect(grid.solved?).to be_false
			grid.solve
			expect(grid.solved?).to be_true
			# expect(grid.to_s).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
		end

		

	end
	
end