require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do
  describe "GET /help" do
    it "works! (now write some real specs)" do
      get help_path
      expect(response).to have_http_status(200)
    end
  end
end
