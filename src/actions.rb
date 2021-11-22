require_relative 'usage'
class Actions

  def initialize
    @repo = DbRepo.new
  end

  def show(argv)
    unless argv.length == 2
      puts show_usage
      exit 1
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
    @repo.update_entry(argv[1], argv[2])
  end

end
