#rewuir Link class file

feature 'Viewling Links' do
  scenario 'On the links page I can see a list of links' do
    Link.create(url: 'http://www.bbc.co.uk', title: 'BBC')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
    expect(page).to have_content "BBC"
    end
  end
end