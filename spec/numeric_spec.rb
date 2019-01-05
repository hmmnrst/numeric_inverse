using NumericInverse

RSpec.describe "Numeric#inverse" do
	it "returns a multiplicative inverse" do
		expect(Rational(7, 22).inverse).to eql(Rational(22, 7))
		expect(Integer(16).inverse).to eql(Rational(1, 16))
		expect(Float(16).inverse).to eql(0.0625)
		expect(Complex(3, 4).inverse).to eql(Complex(3, -4) / 25)
	end
end
