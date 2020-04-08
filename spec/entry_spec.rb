require 'entry'

describe Entry do
  let(:conn) { PG.connect(dbname: 'daily_diary_test') }

  it 'gives you a list of all diary entries' do
    conn.exec("INSERT INTO entries (body, title, date) VALUES ('This was a rubbish day', 'A rubbish day', NOW()), ('This was a better day', 'A better day', NOW());")
    expect(Entry.all_titles).to eq(['A rubbish day', 'A better day'])
  end

  it 'allows you to create a new entry in the database' do
    Entry.create('An amazing day', 'Today was an amazing day')
    expect(Entry.all_titles).to include('An amazing day')
  end
end
