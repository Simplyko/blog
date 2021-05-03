require "rails_helper"

RSpec.describe Article, type: :model do

	describe "Associations" do
    it { should have_many(:comments).class_name('Comment').dependent(:destroy) }
	end

	describe "Validation" do
		let(:user) { User.create(username: "some")}
		subject {
			described_class.new(title: "Smthng", text: "sometext"*50, writer: user.username)
		}

		it "is valid with valid attributes" do
			expect(subject).to be_valid
		end

		it "is not valid without a writer" do
			subject.writer = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a title" do
			subject.title = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a text" do
			subject.text = nil
			expect(subject).to_not be_valid
		end

		it "is not valid with text < 20 symbol" do
			subject.text = "symbol"
			expect(subject).to_not be_valid
		end
	end
end