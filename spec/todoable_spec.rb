require 'todoable'

RSpec.describe Todoable do
    it "New User returns an User object" do
        expect(Todoable::User.authenticate_user("test", "123456")).to be_a Todoable::User
    end
end
