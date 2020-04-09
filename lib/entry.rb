require 'pg'
require_relative './db_connection'

class Entry
  attr_reader :title, :body, :date, :id

  def initialize(title, body, date = Date.now, id)
    @title = title
    @body = body
    @date = DateTime.parse(date).to_date
    @id = id.to_i
  end

  def self.all
    result = DBConnection.run_query('SELECT * FROM entries;')
    result.map do |row|
      Entry.new(row['title'], row['body'], row['date'], row['id'])
    end
  end

  def self.create(title, body)
    result = DBConnection.run_query("INSERT INTO entries (title, body, date) VALUES ($$#{title}$$, $$#{body}$$, NOW()) RETURNING id, title, body, date;")
    Entry.new(result[0]['title'], result[0]['body'], result[0]['date'], result[0]['id'])
  end

  def self.find_by_id(id)
    result = DBConnection.run_query("SELECT * FROM entries WHERE id=#{id};")
    Entry.new(result[0]['title'], result[0]['body'], result[0]['date'], result[0]['id'])
  end
end
