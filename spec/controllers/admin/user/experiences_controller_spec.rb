require 'rails_helper'
include Admin::SessionsHelper

RSpec.describe Admin::User::ExperiencesController do
  let(:user) {FactoryGirl.create(:user) }
  let(:experience) {FactoryGirl.create(:experience) }

  before {sign_in(user) }

  describe "POST create" do
    it "has a 302 status code" do
      post :create, experience: { name: experience.name, year: experience.year, language: experience.language }
      expect(response).to have_http_status(302)
    end
  end
end
