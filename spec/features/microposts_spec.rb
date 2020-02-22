require 'rails_helper'

RSpec.feature "Microposts", type: :feature do
  scenario 'creates a new micropost' do
    visit root_path
    expect{ click_button "言わせる" }.to change(Micropost, :count).by(1)
  end
end
