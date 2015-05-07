require_relative '../../minitest_helper'

class TestEvent < Minitest::Test
  def test_event_find
    event = Event.find 'railsberry2013'
    assert_equal event.name, 'railsberry2013'
  end
end
