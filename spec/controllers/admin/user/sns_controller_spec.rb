require 'rails_helper'
include Admin::SessionsHelper

RSpec.describe Admin::User::SnsController do
  let(:user) {FactoryGirl.create(:user) }
  let(:sns) {FactoryGirl.create(:sns) }

  before {sign_in(user) }

  describe "POST create" do
    it "has a 302 status code" do
      post :create, sns: {kind: sns.kind, url: sns.url}
      expect(response).to have_http_status(302)
    end
  end
end
