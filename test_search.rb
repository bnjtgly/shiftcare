require 'minitest/autorun'
require_relative 'search'  # Adjust the relative path as needed

class TestSearch < Minitest::Test
  def setup
    @search = Search.new('clients.json')
  end

  def test_search_by_name
    result = @search.search_by_name('Smith')
    assert_equal(2, result.size)
    assert(result.all? { |client| client['full_name'].downcase.include?('smith') })
  end

  def test_search_by_email
    result = @search.search_by_email('protonmail.com')
    assert_equal(2, result.size)
    assert(result.all? { |client| client['email'].downcase.include?('protonmail.com') })
  end

  def test_find_duplicate_emails
    result = @search.find_duplicate_emails
    assert_equal(2, result.size)
    assert(result.all? { |client| client['email'] == 'jane.smith@yahoo.com' })
  end
end

