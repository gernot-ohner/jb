# frozen_string_literal: true

require_relative 'db/jobs_repo'
require_relative 'model/jobs_entry'
require_relative 'io/io_helpers'
require_relative 'actions'

ALLOWED_ARGUMENTS = %i[a u s ls lsn add update list list-open show].freeze

exit_with_usage if ARGV.empty? || !ALLOWED_ARGUMENTS.include?(ARGV[0].to_sym)
argument = ARGV[0]
actions = Actions.new

case argument.to_sym
when :show, :s
  actions.show(ARGV)
when :add, :a
  actions.add
when :update, :u
  actions.update(ARGV)
when :list, :ls
  actions.list
when :'list-open', :lso
  actions.list_open
else
  exit_with_usage
end





