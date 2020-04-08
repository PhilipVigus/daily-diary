require 'db_connection'

describe DBConnection do

  describe '#connect' do
    it 'connects to database' do
      expect { DBConnection.connect }.not_to raise_error
      DBConnection.disconnect
    end
  end

  describe '#disconnect' do
    it 'disconnects from an existing connection' do
      DBConnection.connect
      expect { DBConnection.disconnect }.not_to raise_error
    end

    it 'raises an error if you disconnect before connecting' do
      expect { DBConnection.disconnect }.to raise_error PG::ConnectionBad
    end
  end

  describe '#run_query' do
    it 'runs properly formed SQL queries on the opened connection' do
      DBConnection.connect
      expect(DBConnection.run_query('SELECT * from entries;').ntuples).to eq 0
    end

    context 'raising errors' do
      it 'raises an error if a SQL query is not properly formed' do
        DBConnection.connect
        expect { DBConnection.run_query('SELECT * from wrong_table_name;')}.to raise_error PG::UndefinedTable
      end

      it 'raises an error if you try to run a query before you have connected' do
        expect { DBConnection.run_query('SELECT * from entries;') }.to raise_error PG::ConnectionBad
      end
    end
  end
end
