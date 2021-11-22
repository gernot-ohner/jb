# frozen_string_literal: true

def exit_with_usage
  print_usage
  exit 1
end

def print_usage
  puts 'Usage: jobs [show/s add/a, update/u, remove/rm list/ls, list-open/lsn]'
end

def confirmation
  answer = ''
  answer = prompt 'Are you sure? (y/n)' while answer != 'y' && answer != 'n'
  return true if answer == 'y'

  false
end

def prompt(text)
  puts text
  answer = $stdin.gets
  answer.chomp
end

def prompt_for_entry
  company = prompt 'Which company did you apply at?'
  roles = prompt 'For which roles?'
  locations = prompt 'Locations? (comma separated)'
  url = prompt 'What\'s the url?'
  notes = prompt 'any other notes?'
  JobsEntry.new(company, roles, locations, url, notes)
end
