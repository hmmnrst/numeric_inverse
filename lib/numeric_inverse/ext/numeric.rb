class Numeric
	##
	# Returns its inverse.
	#
	# @return [Numeric] inverse
	#
	# @example
	#   Rational(7, 22).inv   #=> (22/7)
	#   Integer(16).inv       #=> (1/16)
	#   Float(16).inv         #=> 0.0625
	#   Complex(3, 4).inv     #=> ((3/25)-(4/25)*i)
	#
	def inverse
		1.quo(self)
	end

	alias inv inverse
end
