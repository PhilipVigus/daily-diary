class DBConnection
  def self.run_query(query)
    connect
    begin
      result = @conn.exec(query)
    ensure
      disconnect
    end

    result
  end

  # private method
  def self.connect
    database = ENV['ENVIRONMENT'] == 'test' ? 'daily_diary_test' : 'daily_diary'
    @conn = PG.connect(dbname: database)
  end

  # private method
  def self.disconnect
    @conn.close
  end

  private_class_method :connect, :disconnect
end
