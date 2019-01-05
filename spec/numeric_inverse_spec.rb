RSpec.describe NumericInverse do
	it "has a version number" do
		expect(NumericInverse::VERSION).not_to be nil
	end

	it "raises NoMethodError before activation" do
		expect { 1.inverse }.to raise_error(NoMethodError)
	end
end
