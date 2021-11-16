
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
