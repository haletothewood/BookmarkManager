def submit_new_link
  visit '/links/new'
  fill_in :url, with: 'https://www.economist.com'
  fill_in :title, with: 'Economist'
  fill_in :tags, with: 'news'
  click_button 'Create Link'
end

def submit_bubble_tagged_link
  visit '/links/new'
  fill_in :url, with: 'www.bubble.com'
  fill_in :title, with: "Bubble Things"
  fill_in :tags, with: "bubbles"
  click_button 'Create Link'
end

def create_new_tagged_links
  Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
  Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
  Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
end

def create_multi_tagged_link
  visit '/links/new'
  fill_in :url, with: 'www.bubble.com'
  fill_in :title, with: "Bubble Things"
  fill_in :tags, with: "bubbles things"
  click_button 'Create Link'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'david@example.com'
  fill_in :password, with: 'password'
  click_button 'Sign Up'
end
