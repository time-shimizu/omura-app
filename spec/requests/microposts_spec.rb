require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  let!(:micropost) {create(:micropost)}
  before do
    get root_path
  end
  describe "GET /microposts" do
    it "works! (now write some real specs)" do
      expect(response).to have_http_status(200)
    end

    it "@micropost is in page" do
      expect(response.body).to include micropost.content
    end
  end
end
