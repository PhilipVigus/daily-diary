require 'entry'

feature 'add comments to existing entries' do
  scenario 'when viewing an entry, I can add a comment' do
    Entry.create('A new day', 'This is a brand new, lovely day')
    visit '/entries'
    click_link 'A new day'
    click_button 'Add comment'
    fill_in 'comment', with: 'What a wonderful entry'
    click_button 'Add comment'
    expect(page).to have_content 'What a wonderful entry'
  end
end
