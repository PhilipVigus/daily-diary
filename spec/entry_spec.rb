require 'entry'
require 'db_connection'

describe Entry do
  describe '.all' do
    it 'gives you a list of all diary entries with the first entry present' do
      entry = Entry.create('A rubbish day', 'This was a rubbish day')
      Entry.create('A better day', 'This was a better day')
      entries = Entry.all
      expect(entries.length).to eq 2
      expect(entries.first).to be_a Entry
      expect(entries.first.title).to eq 'A rubbish day'
      expect(entries.first.body).to eq 'This was a rubbish day'
      expect(entries.first.id).to eq entry.id
    end
  end

  describe '.create' do
    it 'creates a new entry in the database with the correct title' do
      entry = Entry.create('An amazing day', 'Today was an amazing day')
      entry_in_db = DBConnection.run_query("SELECT * FROM entries WHERE id=#{entry.id};")
      expect(entry.title).to eq 'An amazing day'
      expect(entry.body).to eq 'Today was an amazing day'
      expect(entry.date).to be_a Date
      expect(entry.id).to eq entry_in_db.first['id'].to_i
      expect(entry.comments).to be_a Array
      expect(entry.comments.length).to eq 1
      expect(entry.comments[0]).to eq ['This is a comment']
    end
  end

  describe '.find_by_id' do
    it 'returns the entry with the specified id' do
      created_entry = Entry.create('A rubbish day', 'This was a rubbish day')
      returned_entry = Entry.find_by_id(created_entry.id)
      expect(returned_entry.id).to eq created_entry.id
      expect(returned_entry.title).to eq created_entry.title
      expect(returned_entry.body).to eq created_entry.body
      expect(returned_entry.date).to eq created_entry.date
    end
  end
end
