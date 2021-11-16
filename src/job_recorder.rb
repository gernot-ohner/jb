# frozen_string_literal: true

require_relative 'db/jobs_repo'
require_relative 'model/jobs_entry'
require_relative 'io/io_helpers'

possible_arguments = %i[add update ls]
if ARGV.empty? || !possible_arguments.include?(ARGV[0].to_sym)
  puts 'Usage: jobs [add/a, update/u, list/ls, list-open/lsn]'
  exit 1
end
argument = ARGV[0]
repo = DbRepo.new


case argument.to_sym
when :add, :a
  puts 'adding entry'
  repo.add_entry(prompt_for_entry)
when :update, :u
  puts "updating entry with id #{ARGV[1]} to status #{ARGV[2]}"
  repo.update_entry(ARGV[1], ARGV[2])
when :list, :ls
  puts 'listing entries'
  puts repo.list_entries
when :'list-open', :lso
  puts 'listing not closed entries'
  puts repo.list_entries
else
  puts 'Usage: jobs [add, update, ls]'
  exit 1
end





