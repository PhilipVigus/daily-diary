feature 'Add new diary entries' do
  scenario 'When I add an entry, it shows up in the entry list' do
    visit '/new-entry'
    fill_in 'title', with: 'My thoughts for today'
    fill_in 'body', with: 'My thoughts for today are random, random things'
    click_button 'Add entry'
    expect(page).to have_content 'My thoughts for today'
  end
end
