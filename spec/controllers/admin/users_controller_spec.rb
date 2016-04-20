require 'rails_helper'
include Admin::SessionsHelper

RSpec.describe Admin::UsersController do
  let(:user) {FactoryGirl.create(:user) }

  before {sign_in(user) }

  describe "GET index" do
    it "has a 200 status code with admin" do
      user.toggle!(:admin)
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET index" do
    it "has a 302 status code not admin" do
      get :index
      expect(response).to have_http_status(302)
    end
  end

  describe "GET show/:id" do
    it "has a 200 status code" do
      get :show, id: user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
