require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get check" do
    get questions_check_url
    assert_response :success
  end
end
