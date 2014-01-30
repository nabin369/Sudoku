class Cell

	

	def initialize(value)
		@value = value
		@neighbour = []
	end

	attr_accessor :value

	def filled_out?
		@value && value != 0
	end

	def solve
		#do nothing if solved
		# request the list of candidates and 
		# get a new value if there's only one possible candidate
		return if filled_out?
		candidates if candidates.length == 1
		
	end

	def candidates
			(1..9).to_a - @value
	end

	def neighbour(value)
		@value << value
	end
end