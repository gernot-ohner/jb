require 'sqlite3'

require_relative 'entity'

class DbRepo

  def initialize
    @db = SQLite3::Database.new '../../jobs.db'
    init_table
  end

  def init_table
    @db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS applications (
        id INTEGER PRIMARY KEY,
        company VARCHAR(255),
        roles VARCHAR(255),
        locations VARCHAR(255),
        url VARCHAR(255),
        notes VARCHAR(255),
        status VARCHAR(255)
      );
    SQL
  end

  def add_entry(entry)
    query = <<-SQL
      INSERT INTO applications (company, roles, locations, url, notes, status) VALUES ( ?, ?, ?, ?, ?, ? )
    SQL
    @db.execute(query, entry.to_hash.values_at(:company, :roles, :locations, :url, :notes, :status))
  end

  def list_entries
    entries = []
    @db.execute('select * from applications') do |row|
      entries.push JobsEntity.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
    end
    entries
  end

  def list_not_closed_entries
    entries = []
    @db.execute('select * from applications where status != \'closed\'') do |row|
      entries.push JobsEntity.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
    end
    entries
  end

  def update_entry(id, new_status)
    update_q = <<-SQL
      UPDATE applications
      SET status = ?
      WHERE id = ?
    SQL
    @db.execute(update_q, new_status, id)
    @db.execute('select * from applications WHERE id = ?', id) do |row|
      puts JobsEntity.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
    end
  end

  def entry(id)
    @db.execute('select * from applications WHERE id = ?', id) do |row|
      puts JobsEntity.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
    end
  end

  def remove(id)
    @db.execute('DELETE FROM applications WHERE id = ?', id)
  end
end
