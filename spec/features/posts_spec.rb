require "spec_helper"

describe "the publishing process" do
  let!(:user1) { create :user }
  let!(:user2) { create :user }
  let!(:post) { create :post, user: user1, sender_id: user2.id }

  it "create" do
    auth user2
    visit user_path user1
    within('#new_post') do
      fill_in 'post_body', with: 'Hello, my friend!'
      click_button I18n.t 'create'
    end
    expect(page).to have_content 'Hello, my friend!'
  end

  it "delete post" do
    auth user2
    visit user_path user1
    save_and_open_page
    find('.glyphicon.glyphicon-remove').click
    expect(page).not_to have_content 'Hi, friend'
  end
end
