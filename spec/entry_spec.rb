require 'entry'
require 'db_connection'

describe Entry do
  subject do
    Entry.new('Title', 'Body', '2020-04-08 18:15:25.71574')
  end

  it 'gives you a list of all diary entries' do
    Entry.create('A rubbish day', 'This was a rubbish day')
    Entry.create('A better day', 'This was a better day')
    expect(Entry.all_titles[0].title).to eq('A rubbish day')
  end

  it 'allows you to create a new entry in the database' do
    Entry.create('An amazing day', 'Today was an amazing day')
    expect(Entry.all_titles).to include('An amazing day')
  end

  it 'has a title' do
    expect(subject.title).to eq 'Title'
  end

  it 'has a body' do
    expect(subject.body).to eq 'Body'
  end

  it 'has an id' do
    expect(subject.id).to eq 0
  end

  it 'has a date' do
    expect(subject.date).to eq '2020-04-08 18:15:25.71574'
  end
end
