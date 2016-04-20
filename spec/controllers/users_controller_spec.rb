require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { FactoryGirl.create(:user) }

  describe "GET show/:full_name" do
    it "has a 200 status code" do
      get :show, full_name: user.full_name
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
