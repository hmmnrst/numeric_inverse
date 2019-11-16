require "numeric_inverse/version"

##
# Provides refinements of a method +Numeric#inverse+
# to get a (usual/modular) multiplicative inverse of a number readily.
#
module NumericInverse
	refine Numeric do
		def inverse
			1.quo(self)
		end

		alias inv inverse
	end

	refine Integer do
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
				      "modulus #{m} is not coprime to #{self}"
			end

			x = -x if a < 0
			x % m   # 0 <= x < m || m < x <= 0
		end

		alias inv inverse
	end
end
