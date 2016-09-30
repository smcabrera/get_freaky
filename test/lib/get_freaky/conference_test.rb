require_relative '../../minitest_helper'

class TestConference < Minitest::Test
  def test_conference_find_existing_conf
    conf = Conference.find 'GORUCO'
    assert_equal conf.name, 'GORUCO'
  end

  def test_conference_find_existing_conf_name_with_special_chars
    conf = Conference.find 'AWS re:Invent'
    assert_equal conf.name, 'AWS re:Invent'
  end

  def test_conference_find_bogus_conf
    conf = Conference.find('bogus')
    assert_equal conf.name, "Error: No conference was found with that name"
  end

  def test_all_conference
    confs = Conference.all
    refute confs.first["name"]
  end
end
