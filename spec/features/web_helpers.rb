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
