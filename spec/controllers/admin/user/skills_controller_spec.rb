require 'rails_helper'
include Admin::SessionsHelper

RSpec.describe Admin::User::SkillsController do
  let(:user) {FactoryGirl.create(:user) }
  let(:skill) {FactoryGirl.create(:skill) }

  before {sign_in(user) }

  describe "POST create" do
    it "has a 302 status code" do
      post :create, skill: {name: skill.name, degree: skill.degree, type: skill.type}
      expect(response).to have_http_status(302)
    end
  end
end
