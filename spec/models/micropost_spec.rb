require 'rails_helper'

RSpec.describe Micropost, type: :model do
  it "is valid with a content" do
    micropost = Micropost.new(
      content: "Sample content"
    )
    expect(micropost).to be_valid
  end

  it "is invalid without a content" do
    micropost = Micropost.new(
      content: nil
    )
    micropost.valid?
    expect(micropost.errors[:content]).to include("can't be blank")
  end

  it "is ordered by creted_at desc" do
    old_micropost = Micropost.create(content: "Old content")
    new_content = Micropost.create(content: "New content")
    expect(Micropost.first).to eq new_content
  end

  it "has a valid factory without text of FactoryBot" do
    expect(build(:micropost)).to be_valid
  end
end
