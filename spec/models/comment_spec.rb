require "rails_helper"

RSpec.describe Comment, type: :model do
	describe "Associations" do
		it { should belong_to(:article)}	
	end

	describe "Validation" do
		let(:user) { User.create(username: "some")}
		let(:article) { Article.create(title: "Smthng", text: "sometext"*50, writer: user.username)}

		subject {
			described_class.new(body: "Smthng", author: user.username, article_id: article.id)
		}

		it "is valid with valid attributes" do
			expect(subject).to be_valid
		end

		it "is not valid without a writer" do
			subject.author = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a body" do
			subject.body = nil
			expect(subject).to_not be_valid
		end

	end
end