class Comment
  attr_reader :text, :id, :entry_id
  def initialize(id, text, entry_id)
    @id = id
    @text = text
    @entry_id = entry_id
  end

  def self.create(id, text, entry_id)
    Comment.new(id, text, entry_id)
  end
end
