require 'pg'
require 'db_connection'

class Entry
  def self.all_titles
    query_result = DBConnection.run_query('SELECT * FROM entries;')
    query_result.map { |row| row['title'] }
  end

  def self.create(title, body)
    DBConnection.run_query("INSERT INTO entries (title, body, date) VALUES ('#{title}', '#{body}', NOW());")
  end
end
