require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    subject {
      described_class.new(
        id: 1,
        name: "World's Largest Smartwatch",
        category_id: 1,
        quantity: 32,
        price: 2_026.29,
      )
    }
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a title" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a category_id" do
      subject.category_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
  end
end

