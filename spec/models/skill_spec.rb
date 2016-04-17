require 'rails_helper'

RSpec.describe Skill, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  before do
    @skill = Skill.new(user_id: user.id, name: "test_skill", degree: 1, type: "Skill::Work")
  end

  subject { @skill }

  it { should respond_to(:user_id) }
  it { should respond_to(:name) }
  it { should respond_to(:degree) }
  it { should respond_to(:type) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @skill.user_id = nil }
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @skill.name = " " }
    it { should_not be_valid }
  end

  describe "when degree is not present" do
    before { @skill.degree = nil }
    it { should_not be_valid }
  end

  describe "when type is not present" do
    before { @skill.type = " " }
    it { should_not be_valid }
  end
end
