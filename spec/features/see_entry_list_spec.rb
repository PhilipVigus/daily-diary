feature 'see a list of diary entries' do
  let(:conn) { PG.connect(dbname: 'daily_diary_test') }

  scenario 'the /entries page should list all of the diary entry titles' do
    conn.exec("INSERT INTO entries (body, title, date) VALUES ('This was a rubbish day', 'A rubbish day', NOW()), ('This was a better day', 'A better day', NOW());")
    visit '/entries'
    expect(page).to have_content('A rubbish day')
    expect(page).to have_content('A better day')
  end
end
