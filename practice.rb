sql = <<-SQL 
    CREATE TABLE IF NOT EXISTS students
    (
        id INTEGER PRIMARY KEY,
        name TEXT,
    )
SQL
ActiveRecord::Base.connection.execute(sql)