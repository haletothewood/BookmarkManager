feature 'Creating new link' do
  scenario "I can submit a new link" do
    submit_new_link
    expect(page).to have_content "https://www.economist.com"
  end
end