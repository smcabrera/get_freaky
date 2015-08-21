class Event
  include HTTParty
  BASE_URI = "http://confreaks.tv/api/v1"
  base_uri "http://confreaks.tv/api/v1"
  attr_accessor :short_code, :conference_name, :conference_id, :video_count, :date

  # TODO: I'm pretty sure that at this number of arguments it should just take a hash
  def initialize(params = {})
    self.short_code = params[:short_code]
    self.conference_name = params[:conference_name]
    self.conference_id = params[:conference_id]
    self.video_count = params[:video_count]
    self.date = params[:date]
  end

  # Alias short_code as name; "short_code" is consistent with the api, but "name" is easier to remember
  def name
    short_code
  end

  def to_s
    %Q{\nConference: #{conference_name}\nNumber of Videos: #{video_count}}
  end

  def self.find(short_code)
    response = get("/events/#{short_code}.json")
    if response["status"] == 404
      NullEvent.new("No event was found with that name")
    elsif response.success?
      self.new(
        {
          :short_code      => response["short_code"],
          :conference_name => response["conference"]["name"],
          :conference_id   => response["conference"]["id"],
          :video_count     => response["video_count"],
          :date            => fix_date(response["start_at"])
        }
      )
    else
      # This raises the net/http response that was raised
      raise response.response
    end
  end

  def find_conference
    Conference.find(self.conference_name)
  end

  def videos
    response = HTTParty.get("#{BASE_URI}/events/#{short_code}/videos.json")
    if response.success?
      return response
    else
      # This raises the net/http response that was raised
      raise response.response
    end
  end

  # TODO: This implementation isn't really ideal. By calling the videos method you're hitting the api again.
  # Ideally you want to just hit the api once and store that information away since you know that hitting the API takes more resources (and time frankly) then just storing the names in memory which is all you really care about until you need to actually get the information for that particular video
  # Probably should do something like store the list of video names as strings as soon as you create the object and then keep that array for future use
  # This seems slightly better but I'm still not sure it's ideal
  def video_list
    videos.map { |video| video["title"] }
  end

  def valid?
    true
  end

  private

  def self.fix_date(date)
    year, month, day = date[0..3].to_i, date[5..6].to_i, date[8..9].to_i
    Date.new(year, month, day)
  end

end
