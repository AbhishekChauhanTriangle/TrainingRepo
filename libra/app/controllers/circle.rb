class Circle
	attr_accessor :radius
	include Comparable  # Predefined Module used for comparing object 
	# We can include as well as Extend Comparable Module
	def initialize(r)
		@radius = r
	end

	def <=>(other)  # Hash Rocket method, inherited from Comparable.
		@radius <=> other.radius
	end
end