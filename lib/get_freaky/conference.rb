class Conference
  include HTTParty
  base_uri "http://confreaks.tv/api/v1"
  attr_accessor :name, :event_count, :events

  def initialize(name, event_count, events)
    self.name = name
    self.event_count = event_count
    self.events = events
  end

  def self.find(name)
    slug = create_slug(name)
    response = get("/conferences/#{slug}.json")
    # TODO: I need to figure out a better way of dealing with 404 errors
    if response["status"] == 404
      NullConference.new("No conference was found with that name")
    elsif response.success?
      self.new(
        response["name"],
        response["event_count"],
        response["events"]
      )
    else
      # this just raises the net/http response that was raised
      raise response.response
    end
  end

  def self.all
    conferences = get("/conferences.json")
    conference_names = conferences.collect{|c| c["name"]}
  end

  def event_list
    if valid? 
      events.map { |event| event["short_code"] }
    else
      "There was no conference found by that name."
    end
  end

  def valid?
    true
  end

  def self.create_slug(title)
    title.
      downcase.
      # we cannot use slugify method below, one conference name has `:` char which must exist in url name (slug)
      gsub(/[ ._]/, "-").
      gsub(/([|])/) { |match| CGI.escape(match) }
  end
end
