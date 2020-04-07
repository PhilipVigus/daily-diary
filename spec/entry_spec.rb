require 'entry'

describe Entry do
  it 'gives you a list of all diary entries' do
    expect(Entry.all_titles).to eq([
        'A rubbish day',
        'A better day',
        'An amazing day'
    ])
  end
end
