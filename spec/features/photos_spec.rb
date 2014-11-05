require "spec_helper"

describe "the photo" do

  let!(:user) { create :user }
  let!(:photo) { create :photo }

  before(:each) do
    auth user
  end

  it "vote like" do
    visit album_photo_path photo.album, photo
    find('.vote_link').click
    expect(find('.badge')).to have_content 1
  end

  it "vote unlike" do
    visit album_photo_path photo.album, photo
    find('.vote_link').click
    find('.vote_link').click
    expect(find('.badge')).to have_content 0
  end
end
