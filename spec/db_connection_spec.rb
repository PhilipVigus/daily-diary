require 'db_connection'

describe DBConnection do
  describe '#run_query' do
    it 'runs properly formed SQL queries on the opened connection' do
      expect(DBConnection.run_query('SELECT * from entries;').ntuples).to eq 0
    end

    context 'raising errors' do
      it 'raises an error if a SQL query is not properly formed' do
        expect { DBConnection.run_query('SELECT * from wrong_table_name;')}.to raise_error PG::UndefinedTable
      end
    end
  end
end
