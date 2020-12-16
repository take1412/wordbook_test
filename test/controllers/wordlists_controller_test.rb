require 'test_helper'

class WordlistsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get wordlists_index_url
    assert_response :success
  end
end
