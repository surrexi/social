require "spec_helper"

def create_comment(user, photo)
  auth user
  visit album_photo_path(photo.album, photo)
  within('#new_comment') do
    fill_in 'comment_body', with: 'The best photo!'
    click_button I18n.t 'create'
  end
end

describe "the process commented" do
  let!(:user1) { create :user }
  let!(:user2) { create :user }
  let!(:photo) { create :photo }
  let!(:comment) { create :comment, user: user2, photo: photo }

  it "create" do
    create_comment user1, photo
    expect(page).to have_content 'The best photo!'
  end

  it "delete own comment" do
    create_comment user1, photo
    find('.glyphicon.glyphicon-remove').click
    expect(page).not_to have_content 'The best photo!'
  end

  it "delete of another commit" do
    auth user1
    visit album_photo_path photo.album, photo
    expect(page).not_to have_css '.glyphicon.glyphicon-remove'
  end
end
