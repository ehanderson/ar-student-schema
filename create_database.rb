require 'sqlite3'

class CreateDatabase
  def initialize(name)
    @name = name
    @columns = []
  end

  def add_column(column_name, column_type)
    @columns << "#{column_name} #{column_type} NOT NULL"
  end

  def create
    make_database
    string = compose_create_table_string
    execute_create_table_string(string)
  end

  def make_database
    $db = SQLite3::Database.new(@name + ".db")
  end

  def compose_create_table_string
    string = "CREATE TABLE " + @name + " ("
    @columns.each do |column|
      string += column + ", "
    end
    string += "id INTEGER PRIMARY KEY AUTOINCREMENT);"
  end

  def execute_create_table_string(string)
    puts "here"
    $db.execute(string)
  end
end

planes = CreateDatabase.new("planes")
planes.add_column("type", "VARCHAR(64)")
planes.add_column("name", "VARCHAR(64)")
planes.add_column("price", "INTEGER")
planes.create
