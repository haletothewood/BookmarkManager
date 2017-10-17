def submit_new_link
  visit '/links/new'
  fill_in :url, with: 'https://www.economist.com'
  fill_in :title, with: 'Economist'
  click_button 'Submit'
end