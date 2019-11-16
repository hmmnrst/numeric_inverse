using NumericInverse

RSpec.describe "Integer#inverse" do
	context "when no arguments given" do
		it "returns a usual multiplicative inverse" do
			expect(63.inverse).to eql(Rational(1, 63))
		end
	end

	context "when a modulus given" do
		context "and when GCD(self, modulus) == 1" do
			it "returns a modular multiplicative inverse" do
				expect( 63.inverse( 100)).to eql(27 %  100)
				expect(-63.inverse( 100)).to eql(73 %  100)
				expect( 63.inverse(-100)).to eql(27 % -100)
				expect(-63.inverse(-100)).to eql(73 % -100)
			end
		end

		context "and when GCD(self, modulus) != 1" do
			it "raises ArgumentError" do
				expect { 64.inverse(100) }.to raise_error(ArgumentError, "modulus is not coprime to the receiver")
			end
		end
	end
end
