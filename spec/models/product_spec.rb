require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  before do
    @product = Product.new(user_id: user.id, name: "test_product", about: "test test", based_on: "Rails", url: "http://sample.cm", degree: 1)
  end

  subject { @product }

  it { should respond_to(:user_id) }
  it { should respond_to(:name) }
  it { should respond_to(:about) }
  it { should respond_to(:based_on) }
  it { should respond_to(:url) }
  it { should respond_to(:degree) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @product.user_id = nil }
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @product.name = " " }
    it { should_not be_valid }
  end

  describe "when about is present" do
    before { @product.about = " " }
    it { should be_valid }
  end

  describe "when based_on is not present" do
    before { @product.based_on = " " }
    it { should_not be_valid }
  end

  describe "when degree is not present" do
    before { @product.degree = nil }
    it { should_not be_valid }
  end
end
