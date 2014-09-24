require "spec_helper"

describe "the process update" do
  let(:user1) { create :user }
  let(:user2) { create :user, email: 'bart@gmail.com' }
  let(:user3) { create :user, email: 'gomer@gmail.com' }

  it "update own profile" do
    auth user2
    visit edit_user_path(user2)
    within("#edit_user_#{ user2.id }") do
      fill_in 'First name', with: 'Симпсон'
      click_button 'Update User'
    end
    expect(page).to have_content 'Симпсон'
  end

  it "update of another profile" do
    auth user2
    visit edit_user_path(user3)
  end
end
