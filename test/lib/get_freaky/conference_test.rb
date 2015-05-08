require_relative '../../minitest_helper'

class TestConference < Minitest::Test
  def test_conference_find_existing_conf
    conf = Conference.find 'GORUCO'
    assert_equal conf.name, 'GORUCO'
  end

  def test_conference_find_bogus_conf
    conf = Conference.find('bogus')
    assert_equal conf.name, "Not Found"
  end
end
