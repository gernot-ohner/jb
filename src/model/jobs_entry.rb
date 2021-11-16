class JobsEntry

  def initialize_from_hash(entry_hash)
    @company = entry_hash[:company]
    @url = entry_hash[:url]
    @roles = entry_hash[:roles]
    @locations = entry_hash[:locations]
    @notes = entry_hash[:notes]
    @status = :open
  end

  def initialize(company, roles, locations, url, notes)
    @company = company
    @roles = roles
    @locations = locations
    @url = url
    @notes = notes
    @status = :open
  end

  def to_hash
    {
      company: @company,
      roles: @roles,
      locations: @locations,
      url: @url,
      notes: @notes,
      status: @status.to_s.upcase
    }
  end

  def to_s
    "[company: #{@company} , status: #{@status}]"
  end
end