def submit_new_link
  visit '/links/new'
  fill_in :url, with: 'https://www.economist.com'
  fill_in :title, with: 'Economist'
  fill_in :tags, with: 'news'
  click_button 'Create Link'
end