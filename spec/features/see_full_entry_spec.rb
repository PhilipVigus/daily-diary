require 'db_connection'

feature 'Clicking a title lets you see the full entry' do
  scenario 'Clicking an entry title takes you to a page with it fully displayed' do
    DBConnection.run_query("INSERT INTO entries (body, title, date) VALUES ('This was a rubbish day', 'A rubbish day', NOW());")
    visit '/'
    click_link 'A rubbish day'
    expect(page).to have_content 'A rubbish day'
    expect(page).to have_content 'This was a rubbish day'
  end
end
