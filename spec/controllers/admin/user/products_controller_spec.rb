require 'rails_helper'
include Admin::SessionsHelper

RSpec.describe Admin::User::ProductsController do
  let(:user) {FactoryGirl.create(:user) }
  let(:product) {FactoryGirl.create(:product) }

  before {sign_in(user) }

  describe "POST creat" do
    it "has a 302 status code" do
      post :create, product: {
                              name: product.name,
                              about: product.about,
                              based_on: product.based_on,
                              url: product.url,
                              degree: product.degree
                            }
      expect(response).to have_http_status(302)
    end
  end
end
