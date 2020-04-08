require 'pg'

class Entry
  def self.all_titles
    database = ENV['ENVIRONMENT'] == 'test' ? 'daily_diary_test' : 'daily_diary'

    conn = PG.connect(dbname: database)
    conn.exec('SELECT * FROM entries;').map { |row| row['title'] }
  end

  def self.create(title, body)
    database = ENV['ENVIRONMENT'] == 'test' ? 'daily_diary_test' : 'daily_diary'
    conn = PG.connect(dbname: database)
    conn.exec("INSERT INTO entries (title, body, date) VALUES ('#{title}', '#{body}', NOW());")
  end
end
