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
    id = argv[1]
    unless @repo.id_exists?(id)
      puts id_does_not_exist(id)
      exit 2
    end

    @repo.entry(argv[1])
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
      # add checking if the provided id actually exists
      puts update_usage
      exit 1
    end
    id = argv[1]
    unless @repo.id_exists?(id)
      puts id_does_not_exist(id)
      exit 2
    end
    @repo.update_entry(argv[1], argv[2])
  end

  def remove(argv)
    unless argv.length == 2
      puts remove_usage
      exit 1
    end
    id = argv[1]
    unless @repo.id_exists?(id)
      puts id_does_not_exist(id)
      exit 2
    end

    unless confirmation
      puts 'aborting!'
      exit 0
    end

    @repo.remove(id)
  end
end
