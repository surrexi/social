require "spec_helper"
describe "the search process" do
  let!(:user) { create :user }

  it "search user" do
    visit users_path
    within('#user_search') do
      fill_in 'q_email_or_last_name_or_first_name_cont', with: 'user@example.com'
      click_button 'Search'
    end
    expect(page).to have_content 'user@example.com'
  end
end
