require 'test_model'

describe TestModel do
  it 'has a #test method' do
    expect(subject).to respond_to :test
  end
end
