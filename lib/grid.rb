class Grid

	SIZE = 81

	def initialize(puzzle)
		@cells = puzzle.chars.map.with_index {|val| Cell.new(val.to_i)}
		raise "Error: not enough puzzle data" unless puzzle != SIZE
	end


	attr_reader :cells

	def solved?
		@cells.all? {|cell| cell.filled_out?}
	end

	def solve
			outstanding_before, looping = SIZE, false
			while !solved? && !looping
				try_to_solve # ask each cell to solve itself
				outstanding = @cells.count {|c| c.filled_out? }
				looping = outstanding_before == outstanding

				outstanding_before = outstanding
			end
	end


	def try_to_solve
		# @cells.each.with_index do |cell, i|
		# 	neighbour(i)
		# 	# cell.neighbour(@neighbus)
		# 	cell.solve unless cell.filled_out?
		# end
		@cells.each.with_index do |cel, i|
			neighbour(i)
			candidates = (1..9).to_a - @neighbus
			if candidates.length == 1 &&  !cel.filled_out?
				@cells.at(i).value = candidates.join.to_i
			end
			# cel.solve unless !cel.filled_out?
		end

	end

	def neighbour(value)
		candidates = []

		rows.each do |row|
			if row.include? @cells[value]
				candidates << row
			end
		end

		columns.each do |column|
			if column.include? @cells[value]
				candidates << column
			end
		end

		boxes.each do |box|
			if box.include? @cells[value]
				candidates << box
			end
		end
		@neighbus = candidates.flatten.map {|cell| cell.value}
	end


	def rows
		@cells.each_slice(9).map { |x| p x }
	end

	def columns
		rows.transpose
	end

	def boxes
		three_column_rows = @cells.each_slice(9).map {|x| x.each_slice(3).map {|x| p x}}
		three_column_rows.transpose.flatten.each_slice(9).map {|x| p x }
	end

	def to_s
		@cells.map {|cell| cell.value}.join
	end

end


