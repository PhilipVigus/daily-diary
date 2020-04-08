require 'db_connection'

feature 'see a list of diary entries' do
  scenario 'the /entries page should list all of the diary entry titles' do
    DBConnection.run_query("INSERT INTO entries (body, title, date) VALUES ('This was a rubbish day', 'A rubbish day', NOW());")
    visit '/entries'
    expect(page).to have_content('A rubbish day')
  end
end
