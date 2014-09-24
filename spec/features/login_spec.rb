require "spec_helper"

describe "the signin process" do
  let(:user) { create :user }

  it "login" do
    auth user
    expect(page).to have_content 'Выйти'
  end
end
