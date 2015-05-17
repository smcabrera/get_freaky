require 'paint'

class Video
  include HTTParty
  BASE_URI = "http://confreaks.tv/api/v1"
  base_uri "http://confreaks.tv/api/v1"

  attr_accessor :title, :abstract, :host, :embed_code, :event_short_code

  def initialize(title, abstract, host, embed_code, event_short_code)
    self.title = title
    self.abstract = abstract
    self.host = host
    self.embed_code = embed_code
    # TODO: This feels like a kludge to me--figure out a better way to deal with the event_short_code for featured videos
    self.event_short_code = event_short_code || nil
  end

  def self.find_featured
    response = get("/featured-video.json")
    if response.success?
      self.create_video(response)
    else
      raise response.response
    end
  end

  def self.find(event_short_code, title)
    slug = self.create_slug(event_short_code, title)
    response = get("/videos/#{slug}.json")
    if response.success?
      self.create_video(response, event_short_code)
    else
      raise response.response
    end
  end

  def download
    cmd = %x[ viddl-rb #{url} ]
  end

  def event
    Event.find(event_short_code)
  end

  def to_s
    %Q{\n#{Paint['Title:', :green]} #{title}\n#{Paint["Description:", :green]} #{abstract}\n}
  end

  def url
    if host == "youtube"
      "https://www.youtube.com/watch?v=#{embed_code}"
    elsif host == "vimeo"
      "https://vimeo.com/#{embed_code}"
    end
  end

  private

  def self.create_video(response, event_short_code=nil)
    Video.new(
      response["title"],
      response["abstract"],
      response["host"],
      response["embed_code"],
      event_short_code
    )
  end

  # TODO: That's WAY too many lines of code to do something relatively simple.
  # I'm sure I can do better with some time spent cooking up a regular expression
  # Also I may come up against more situations in which slugify isn't consistent
  # with the way ConFreaks creates slugs--perhaps look into what gem they-re using!
  # For now though...it works!
  def self.create_slug(event_short_code, title)
    _i = "#{event_short_code} #{title}"
    _i = _i.gsub('/', '-').gsub("'", '-')
    _i = _i.slugify
    _i = _i.gsub('---', '-').gsub('--', '-')
    _i = _i.chomp('-').chomp(',')
  end

end

