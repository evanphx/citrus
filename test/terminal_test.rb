require File.expand_path('../helper', __FILE__)

class TerminalTest < Test::Unit::TestCase

  def test_terminal?
    rule = Terminal.new
    assert(rule.terminal?)
  end

  def test_regexp_match
    rule = Terminal.new(/\d+/)
    match = rule.match(input('123 456'))
    assert(match)
    assert_equal('123', match)
    assert_equal(3, match.length)
  end

  def test_regexp_match_failure
    rule = Terminal.new(/\d+/)
    match = rule.match(input(' 456'))
    assert_equal(nil, match)
  end

  def test_regexp_to_s
    rule = Terminal.new(/\d+/)
    assert_equal('/\\d+/', rule.to_s)
  end

  def test_string_match
    rule = Terminal.new('abc')
    match = rule.match(input('abc'))
    assert(match)
    assert_equal('abc', match)
    assert_equal(3, match.length)
  end

  def test_string_match_short
    rule = Terminal.new('abc')
    match = rule.match(input('ab'))
    assert_equal(nil, match)
  end

  def test_string_match_long
    rule = Terminal.new('abc')
    match = rule.match(input('abcd'))
    assert(match)
    assert_equal('abc', match)
    assert_equal(3, match.length)
  end

  def test_string_to_s
    rule = Terminal.new('abc')
    assert_equal('"abc"', rule.to_s)
  end

end
