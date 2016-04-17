require 'rails_helper'

RSpec.describe Sns, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  before do
    @sns = Sns.new(user_id: user.id, url: "http://sample.cm", kind: 0)
  end

  subject { @sns }

  it { should respond_to(:user_id) }
  it { should respond_to(:url) }
  it { should respond_to(:kind) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @sns.user_id = nil }
    it { should_not be_valid }
  end

  describe "when url is not present" do
    before { @sns.url = " " }
    it { should_not be_valid }
  end

  describe "when kind is not present" do
    before { @sns.kind = nil }
    it { should_not be_valid }
  end
end
