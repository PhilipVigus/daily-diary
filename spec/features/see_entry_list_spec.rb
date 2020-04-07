feature 'see a list of diary entries' do
  scenario 'the /entries page should list all of the diary entry titles' do
    visit '/entries'
    expect(page).to have_content('First entry title')
    expect(page).to have_content('Second entry title')
  end
end
