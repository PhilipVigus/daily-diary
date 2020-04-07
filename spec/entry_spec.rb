require 'entry'

describe Entry do
  it 'gives you a list of all diary entries' do
    expect(Entry.all_titles).to eq(['First entry title', 'Second entry title'])
  end
end
