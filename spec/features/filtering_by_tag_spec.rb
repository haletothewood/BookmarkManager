feature 'Viewing links' do
    scenario 'I can filter links by tag' do
      create_new_tagged_links
      visit '/tags/bubbles'
  
      expect(page.status_code).to eq(200)
      within 'ul#links' do
        expect(page).not_to have_content('Makers Academy')
        expect(page).not_to have_content('Code.org')
        expect(page).to have_content('This is Zombocom')
        expect(page).to have_content('Bubble Bobble')
      end
    end

    scenario 'I can add multiple tags to a new link' do
      create_multi_tagged_link
      link = Link.first
      expect(link.tags.map(&:name)).to include('bubbles', 'things')
    end
  end