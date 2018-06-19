$i = 10
require 'helperNew.rb'
require 'set'
class DailyTaskController < ApplicationController

	before_filter :authenticate_user!
	layout 'standard'
	
	@@i = 5
	def sayHello
		@say = {'HelloWorld' => 'First', 'HelloWorld2' => 'Second'}
		respond_to do |format|
			format.html
			format.json{render :json => @say}
		end
	end

	def loopOne # Using Instance as well Local as well Global Variable
		j = 10
		i = 0
		@i = {}
		until i > $count do # Until only runs till condition is false.
			@i[i] = j
			i += 1
			j -= 1
		end
	end

	def loopTwo # Using Instance as well local Variable
		@i = {}
		j = 0
		for i in "aba".."abf"
			@i[j] = i
			j = j + 1
		end
	end

	def loopThree  # Using Class, Local & Instance Variable with Times Iterator
		@i = Array.new
		j = 10
		@@i.times do
			@i << j
			j -= 1 
		end
	end

	def useIfNextIterators # Using IF, NEXT condtition with Step Upto Iterator
		i = Array.new(5){|i| i+1}
		@i = Array.new
		i.each do |var|
			var.upto(var+2) do |var2|
				if(var2 == 0)
					next
				elsif(var2 % 2 == 0)
					@i << var2
				else
					var2 += 1
				end
			end
		end
	end

	def useReturnStepMapInPlace # Using RETURN , Array Modification In-Place, STEP
		@i = 1.step(17,3).to_a
		@i = @i.map do |var|
			var = var + 1
		end
		@i = @i.map do |var2|
			var2 = callingFunction(var2,1)		
		end
	end

	def callingFunction(i,j) # Getting data from Another Function.
		return i+j
	end

	def usingSet # THis function Uses Set
		@i = Set.new
		j = Array.new()
		j << 2 << 3 << 4 
		@i = j.to_set # Converts Array to Set
		@i.add("Ram")
		@i.add(3)    # Add Elements to Set
		@i.add('Rahim')
		@j = Set[1,2,3,4,5]
		@z = Set[3]
		@y = Set[7]

		@common = @i & @j  # Returns Common Elements in Sets
		@diff = @i - @j # Returns Diff i - j Elements in Sets
		@bool = @i == @j # Returns True if Equal
		@isContains = @i === @z  # Return true if i contains z
		@excl = @i ^ @j # Contains Exclusive Elements
		@clear = @z.clear # Clear the Set
		@disjoint = @z.disjoint?@y # Return True if SETS are disjoint
	end

	def funcCallFromDifferentClass
		h = HelperNew.new   # Using Other Class method "helperFunc"
		@i = h.helperFunc(2,3)
	end


	def usingSwitchCase
		i = params[:value][:title]
		i = i.to_i
		@j = 0
		case i   # Using Switch Case
		when 1..5
			@j = 'Value was between 1 to 5'
		when 6..10
			@j = 'Value was between 6 to 10'
		when 11..15
			@j = 'Value was between 11 to 15'
		when 16..20
			@j = 'Value was between 16 to 20'
		else
			@j = 'Value is bigger than 20'
		end
	end

	def openSwitchFile
	end

	def iteratorSelect
		a = [1,2,3,4,5,6,7,8,9,10]
		@i = a.select {|n| n > 2}
	end

	def iteratorSelectRejectCollectInject
		a = [1,2,3,4,5,6,7,8,9,10]
		@i = a.select {|n| n > 2}  # Select Iterator

		a = [1,2,3,4,5,6,7,8,9,10]
		@j = a.reject {|n| n > 2}  # Reject Iterator

		a = [1,2,3,4,5,6,7,8,9,10]
		@k = a.collect {|n| n * 2} # Collect Iterator

		a = [1,2,3,4,5,6,7,8,9,10]
		@l = a.inject {|acc,n| acc + n + 10}  # Inject Iterator
	end

	def usingModules
		# A module can not be instantiated but can be inherited in any number of class and can be reusable.

		c1 = Circle.new(3)
		c2 = Circle.new(4)

		@isEqual = c1 == c2
		@isGreater = c1 > c2
		@isLesser = c1 < c2
	end

	def usingMixins
		# Ruby does not support Multiple Inheritance directly, but supports through Mixins
		s1 = Shape.new
		@i = s1.a1
		@j = s1.b1
	end
end
