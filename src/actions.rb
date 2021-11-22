# frozen_string_literal: true

require_relative 'usage'

# Wrapper class for all allowed actions
class Actions
  def initialize
    @repo = DbRepo.new
  end

  def show(argv)
    unless argv.length == 2
      puts show_usage
      exit 1
    end
    id = validate_id(argv)
    @repo.entry(id)
  end

  def list
    puts 'listing entries'
    puts @repo.list_entries
  end

  def list_open
    puts 'listing not closed entries'
    puts @repo.list_entries
  end

  def add
    puts 'adding entry'
    @repo.add_entry(prompt_for_entry)
  end

  def update(argv)
    unless argv.length == 3
      puts update_usage
      exit 1
    end
    id = validate_id(argv)
    @repo.update_entry(id, argv[2])
  end

  def remove(argv)
    unless argv.length == 2
      puts remove_usage
      exit 1
    end
    id = validate_id(argv)

    unless confirmation
      puts 'aborting!'
      exit 0
    end

    @repo.remove(id)
  end

  private

  def validate_id(argv)
    id = argv[1]
    unless @repo.id_exists?(id)
      puts id_does_not_exist(id)
      exit 2
    end
    id
  end
end
