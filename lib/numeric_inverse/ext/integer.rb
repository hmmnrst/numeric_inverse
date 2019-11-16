##
# @!parse class Integer < Numeric; end
#
class Integer
	##
	# Returns its inverse.
	#
	# @overload inverse
	#   @return [Rational] inverse
	# @overload inverse(m)
	#   @param m [Integer] modulus
	#   @return [Integer] modular multiplicative inverse
	#   @raise [ArgumentError] if +m+ is not coprime to +self+
	#
	# @example
	#   63.inv        #=> (1/63)
	#   63.inv * 63   #=> (1/1)
	#
	#   63.inv(100)              #=> 27
	#   63.inv(100) * 63         #=> 1701
	#   63.inv(100) * 63 % 100   #=> 1
	#
	#   64.inv(100)   #=> ArgumentError: modulus is not coprime to the receiver
	#
	def inverse(m = nil)
		return Rational(1, self) if m.nil?

		# extended Euclidean algorithm
		a, b, x, x0 = self, m, 1, 0
		until b.zero?
			a, (q, b) = b, a.divmod(b)
			x, x0 = x0, x - q * x0
		end

		# x is an inverse iff self.gcd(m) == 1
		if a.abs != 1
			raise ArgumentError,
			      "modulus is not coprime to the receiver"
		end

		x = -x if a < 0
		x % m.abs   # 0 <= x < |m|
	end

	alias inv inverse
end
