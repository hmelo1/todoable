require 'todoable'

RSpec.describe Todoable do
    it "Has a List class" do
        expect(Todoable::List.portray("Broccoli")).to eql("Gross!")
    end

    it "Has a Item class" do
        expect(Todoable::Item.portray("Broccoli")).to eql("Gross!")
    end
end
