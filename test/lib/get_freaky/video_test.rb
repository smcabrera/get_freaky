require_relative '../../minitest_helper'

class TestVideo < Minitest::Test
  def test_video_find
    event_code = 'railsberry2013'
    title = "The Future of Online Learning"
    video = Video.find(event_code, title)
    assert_equal video.title, "The Future of Online Learning"
  end

  def test_video_find_featured
    video = Video.find_featured
    refute_empty video.title
  end

  def test_to_s
    event_code = 'railsberry2013'
    title = "The Future of Online Learning"
    video = Video.find(event_code, title)
    assert video.to_s.include? "The best software developers"
    assert video.to_s.include? title
  end

  def test_slug_apostrophes
    event_code = "arbitrary"
    title = "It's me! Mario!"
    slug = Video.create_slug(event_code, title)
    assert slug.include? "it-s-me-mario"
  end

  def test_slug_stupid_apostrophes
    event_code = "arbitrary"
    title = "It’s me! Mario!"
    slug = Video.create_slug(event_code, title)
    assert slug.include? "it-s-me-mario"
  end

end
