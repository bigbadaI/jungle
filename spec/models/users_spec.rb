require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    subject {
      described_class.new(
        first_name: "Frank",
        last_name: "Burns",
        email: "frankrulz@gmail.ca",
        password: "123456",
        password_confirmation: "123456"
      )
    }
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is valid to have wrong case in email" do
      subject.email = "FRankRulZ@gMaIl.cA"
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with to small of password" do
      subject.password = "123"
      subject.password_confirmation = "123"
      expect(subject).to_not be_valid
    end

    it "is not valid with to big of a password" do
      subject.password = "superlongwordsjusttoinvalidatethepasswordhere"
      subject.password_confirmation = "superlongwordsjusttoinvalidatethepasswordhere"
      expect(subject).to_not be_valid
    end
  end
end
