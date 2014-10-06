require "spec_helper"
describe "the search process" do
  let!(:user) { create :user, email: 'user@example.com' }

  it "search user" do
    auth user
    visit users_path
    within('#user_search') do
      fill_in 'q_email_or_last_name_or_first_name_cont', with: 'user@example.com'
      click_button I18n.t 'users.index.search'
    end
    expect(page).to have_content 'user@example.com'
  end
end
