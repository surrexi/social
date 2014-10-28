def auth(user)
  visit new_user_session_path
  within('#new_user') do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end

def mock_auth_hash
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
    provider: 'facebook',
    uid: '123545',
    info: OmniAuth::AuthHash::InfoHash.new(
      email: 'example@gmail.com'
    )
  )
end
