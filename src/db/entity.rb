class JobsEntity
  attr_accessor :company, :url, :roles, :locations, :notes, :status

  # def initialize_from_hash(entry_hash)
  #   @company = entry_hash[:company]
  #   @url = entry_hash[:url]
  #   @roles = entry_hash[:roles]
  #   @locations = entry_hash[:locations]
  #   @notes = entry_hash[:notes]
  # end

  def initialize(id, company, roles, locations, url, notes, status)
    @id = id
    @company = company
    @roles = roles
    @locations = locations
    @url = url
    @notes = notes
    @status = status
  end

  def to_s
    "[#{@id} | #{@company} | #{@status}]"
  end
end