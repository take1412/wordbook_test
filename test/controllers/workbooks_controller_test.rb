require 'test_helper'

class WorkbooksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get workbooks_index_url
    assert_response :success
  end
end
