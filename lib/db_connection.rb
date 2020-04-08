class DBConnection
  def self.connect
    database = ENV['ENVIRONMENT'] == 'test' ? 'daily_diary_test' : 'daily_diary'
    @conn = PG.connect(dbname: database)
  end

  def self.disconnect
    @conn.close
  end

  def self.run_query(query)
    raise 'unable to run query - not connected to DB' if @conn.nil?
    begin
      @conn.exec(query)
    ensure
      disconnect
    end
  end

  def self.conn
    @conn
  end
end