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
    response = get("/conferences/#{name}.json")
    # TODO: I need to figure out a better way of dealing with 404 errors
    if response["status"] == 404
      self.new(
        "Not Found",
        "Not Found",
        "Not Found"
      )
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

  def event_list
    if events == "Not Found"
      "There was no conference found by that name."
    else
      events.map { |event| event["short_code"] }
    end
  end
end
