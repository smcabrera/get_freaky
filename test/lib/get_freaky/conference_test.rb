require_relative '../../minitest_helper'

class TestConference < Minitest::Test
  def test_conference_find
    conf = Conference.find 'GORUCO'
    assert_equal conf.name, 'GORUCO'
  end
end
