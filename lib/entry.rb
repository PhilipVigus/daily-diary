require 'pg'
require_relative './db_connection'

class Entry
  attr_reader :title, :body, :date, :id

  def initialize(title, body, date = Date.now, id = 0)
    @title = title
    @body = body
    @date = date
    @id = id
  end

  def self.all_titles
    query_result = DBConnection.run_query('SELECT * FROM entries;')
    query_result.map do |row|
      Entry.new(row['title'], row['body'], row['date'], row['id'])
    end
  end

  def self.all
    query_result = DBConnection.run_query('SELECT * FROM entries;')
    query_result.map do |row|
      Entry.new(row['title'], row['body'], row['date'], row['id'])
    end
  end

  def self.create(title, body)
    DBConnection.run_query("INSERT INTO entries (title, body, date) VALUES ('#{title}', '#{body}', NOW());")
  end
end
