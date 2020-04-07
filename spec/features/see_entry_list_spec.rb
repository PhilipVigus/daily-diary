feature 'see a list of diary entries' do
  scenario 'the /entries page should list all of the diary entry titles' do
    visit '/entries'
    expect(page).to have_content('A rubbish day')
    expect(page).to have_content('A better day')
    expect(page).to have_content('An amazing day')
  end
end
