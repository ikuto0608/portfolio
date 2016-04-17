require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(first_name: "first", last_name: "last", email: "hoge@fuga.com",
                     password: "password", password_confirmation: "password")
  end

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:full_name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }
  it { should respond_to(:products) }
  it { should respond_to(:skills) }
  it { should respond_to(:experiences) }
  it { should respond_to(:sns) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end

  describe "when first_name is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last_name is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @user.email = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US_ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(first_name: "nopass", last_name: "man", email: "nopass@man.com", password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should be_invalid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 3 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_falsey }
    end
  end

  describe "remember token" do
    before  { @user.save }
    it { expect(@user.remember_token).not_to be_blank }
  end

  describe "product associations" do

    before { @user.save }
    let!(:older_product) do
      FactoryGirl.create(:product, user: @user, created_at: 1.day.ago)
    end
    let!(:never_product) do
      FactoryGirl.create(:product, user: @user, created_at: 1.hour.ago)
    end

    it "should destroy associated products" do
      @user.destroy
      products = @user.products.to_a
      expect(products).to be_empty
      products.each do |product|
        expect(Product.where(id: product.id).limit(1).first).to be_empty
      end
    end
  end

  describe "skill associations" do
    before { @user.save }
    let!(:older_skill) do
      FactoryGirl.create(:skill, user: @user, created_at: 1.day.ago)
    end
    let!(:never_skill) do
      FactoryGirl.create(:skill, user: @user, created_at: 1.hour.ago)
    end

    it "should destroy associated skills" do
      @user.destroy
      skills = @user.skills.to_a
      expect(skills).to be_empty
      skills.each do |skill|
        expect(Skill.where(id: skill.id).limit(1).first).to be_empty
      end
    end
  end

  describe "experience associations" do
    before { @user.save }
    let!(:older_experience) do
      FactoryGirl.create(:experience, user: @user, created_at: 1.day.ago)
    end
    let!(:never_experience) do
      FactoryGirl.create(:experience, user: @user, created_at: 1.hour.ago)
    end

    it "should destroy associated experiences" do
      @user.destroy
      experiences = @user.experiences.to_a
      expect(experiences).to be_empty
      experiences.each do |experience|
        expect(Experience.where(id: experience.id).limit(1).first).to be_empty
      end
    end
  end

  describe "sns associations" do
    before { @user.save }
    let!(:older_sns) do
      FactoryGirl.create(:sns, user: @user, created_at: 1.day.ago)
    end
    let!(:never_sns) do
      FactoryGirl.create(:sns, user: @user, created_at: 1.hour.ago)
    end

    it "should destroy associated sns" do
      @user.destroy
      sns = @user.experiences.to_a
      expect(sns).to be_empty
      sns.each do |s|
        expect(Sns.where(id: s.id).limit(1).first).to be_empty
      end
    end
  end
end
