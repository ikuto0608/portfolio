require 'rails_helper'

RSpec.describe Admin::SessionsController do
  let(:user) {FactoryGirl.create(:user) }

  describe "POST create" do
    it "has a 302 status code" do
      post :create, session: { email: user.email, password: user.password }
      expect(response).to have_http_status(302)
    end

    it "has a 200 status code mismatch password" do
      post :create, session: { email: user.email, password: "misspassword" }
      expect(response).to have_http_status(200)
    end
  end
end
