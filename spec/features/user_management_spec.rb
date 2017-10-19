feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, david@example.com')
    expect(User.first.email).to eq('david@example.com')
  end
end

feature 'User sign up' do
  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_current_path '/users'
    expect(page).to have_content 'Sorry your passwords didn\'t match'
  end
end