require 'comment'

describe Comment do
  it 'creates a new comment' do
    comment = Comment.create('This is a new comment', 4)
    expect(comment.text).to eq 'This is a new comment'
    expect(comment.id).to eq 0
    expect(comment.entry_id).to eq 4
  end
end
