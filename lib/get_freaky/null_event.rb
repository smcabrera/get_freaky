class NullEvent < ErrorObject
  def short_code; nil ; end
  def conference_name; nil; end
  def conference_id; nil; end
  def video_count; nil; end
  def date; nil; end
  # Could use Avdi Grimm's Naught gem to simplify the above

  def video_list
    to_s
  end

  def name
    to_s
  end

  def valid?
    false
  end
end
