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
	#   Complex("1+2i").inv   #=> ((1/5)-(2/5)*i)
	#
	def inverse
		1.quo(self)
	end

	alias inv inverse
end
