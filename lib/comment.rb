require_relative './db_connection'

class Comment
  attr_reader :text, :id, :entry_id
  def initialize(text, entry_id, id=0)
    @id = id
    @text = text
    @entry_id = entry_id
  end

  def self.create(text, entry_id)
    result = DBConnection.run_query("INSERT INTO comments (comment, entry_id) VALUES ($$#{text}$$, $$#{entry_id}$$) RETURNING id, comment, entry_id;")
    p result
    Comment.new(result[0]['comment'], result[0]['id'], result[0]['entry_id'])
  end
end
