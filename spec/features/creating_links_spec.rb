feature 'Creating new link' do
  scenario "I can submit a new link" do
    submit_new_link
    expect(page).to have_current_path '/links'
  
    within 'ul#links' do
      expect(page).to have_content ('https://www.economist.com')
    end
  end

  scenario 'adding a tag to a link' do
    submit_new_link
    link = Link.first
    expect(link.tags.map(&:name)).to include("news")
  end
end