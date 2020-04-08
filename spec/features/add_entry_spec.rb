feature 'Add new diary entries' do
  scenario 'When I add an entry, it shows up in the entry list' do
    visit '/'
    title.fill_in with: 'My thoughts for today'
    body.fill_in with: 'My thoughts for today are random, random things that nobody should ever hear'
    click_button 'Add entry'
    expect(page).to have_content 'My thoughts for today'
  end
end
