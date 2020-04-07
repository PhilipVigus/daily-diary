require 'pg'

class Entry
  def self.all_titles
    conn = PG.connect(dbname: 'daily_diary')
    conn.exec('SELECT * FROM entries;').map { |row| row['title'] }
  end
end
