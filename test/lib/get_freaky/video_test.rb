require_relative '../../minitest_helper'

class TestVideo < Minitest::Test
  def test_video_find
    event_code = 'railsberry2013'
    title = "The Future of Online Learning"
    video = Video.find(event_code, title)
    assert_equal video.title, "The Future of Online Learning"
  end
end
