module A
	def a1
		return "I am In Module A - Function A1"
	end
end

module B
	def b1
		return "I am in Module B - Function B1"
	end
end

class Shape
	include A
	include B
end