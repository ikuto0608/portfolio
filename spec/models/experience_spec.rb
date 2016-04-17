require 'rails_helper'

RSpec.describe Experience, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  before do
    @experience = Experience.new(user_id: user.id, name: "test experiemce", year: 3, language: "Ruby")
  end

  subject { @experience }

  it { should respond_to(:user_id) }
  it { should respond_to(:name) }
  it { should respond_to(:year) }
  it { should respond_to(:language) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @experience.user_id = nil }
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @experience.name = " " }
    it { should_not be_valid }
  end

  describe "when year is not present" do
    before { @experience.year = nil }
    it { should_not be_valid }
  end

  describe "when language is not present" do
    before { @experience.language = " " }
    it { should_not be_valid }
  end
end
