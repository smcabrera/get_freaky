class Video
  include HTTParty
  BASE_URI = "http://confreaks.tv/api/v1"
  base_uri "http://confreaks.tv/api/v1"
  attr_accessor :title, :abstract, :embed_code

  def initialize(title, abstract, embed_code)
    self.title = title
    self.abstract = abstract
    self.embed_code = embed_code
  end

  def self.find(event_short_code, title)
    slug = self.create_slug(event_short_code, title)
    response = get("/videos/#{slug}.json")
    if response.success?
      Video.new(
        response["title"],
        response["abstract"],
        response["embed_code"]
      )
    else
      raise response.response
    end
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

  def download
    cmd = %x[ viddl-rb #{youtube_url}  ]
  end

  #private

  def youtube_url
    "https://www.youtube.com/watch?v=#{embed_code}"
  end
end

def find(event_short_code, title)
  slug = self.create_slug(event_short_code, title)
  response = HTTParty.get("http://confreaks.tv/api/v1/videos/#{slug}.json")
end



