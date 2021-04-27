require "rails_helper"

RSpec.describe Contact, :type => :model do
	

	it "is valid with valid attributes" do
		contact = Contact.new
		contact.email = "Anything"
		contact.message = "Anything"
		expect(contact).to be_valid
	end

	it "is not valid without a email" do
		contact = Contact.new
		contact.email = nil
		contact.message = "Anything"
		expect(contact).to_not be_valid
	end

	it "is not valid without a message" do
		contact = Contact.new
		contact.email = "Anything"
		contact.message = nil
		expect(contact).to_not be_valid
	end
	
end