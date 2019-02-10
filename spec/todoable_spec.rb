require 'todoable'

RSpec.describe Todoable do
    it "Expect unauthorized user to reutn Unauthorized" do
        expect(Todoable::User.authenticate_user("fake@test.nyc", "notworking").token).to include "Unauthorized"
    end

    test_account = Todoable::User.authenticate_user("heriberto@melo.nyc", "todoable")
    test_list = test_account.list_lists 

    it "::authenticateuser returns an User object with Username, password, and token" do
        expect(test_account).to be_a Todoable::User
        expect(test_account.username).to eq("heriberto@melo.nyc")
        expect(test_account.password).to eq("todoable")
        expect(test_account.password).to be_a String
    end

    it "User#list_items returns a List object" do
        expect(test_list).to be_a Todoable::List
    end

    it "List#index returns an array of listst" do
        expect(test_list.index).to be_a Array
    end

    it "List#create creates a test list named \"Todoable Test Case -- Create\"" do
        temp = test_list.create("Todoable Test Case -- Create")
        test_list_id = temp['id']
        expect(test_list.show(test_list_id)['name']).to include "Todoable Test Case -- Create"
        test_list.delete(test_list_id)
    end
    
    it "List#update edits a test list named \"Todoable Test Case -- Update and deletes it\"" do
        temp = test_list.create("Todoable Test Case -- Create")
        test_list_id = temp['id']
        test_list.update(test_list_id, "Todoable Test Case -- Update")
        expect(test_list.show(test_list_id)['name']).to include "Todoable Test Case -- Update"
        test_list.delete(test_list_id)
    end

    it "List#deletes the appropriate test list" do
        temp = test_list.create("Todoable Test Case -- Create")
        test_list_id = temp['id']
        expect(test_list.delete(test_list_id)).to be nil
    end
end
