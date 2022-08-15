require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = User.create(username: "john",
                              email: "john@mail.com",
                              password: "password", admin: false)
  end

  test "get new article form and create article " do
    sign_in_as(@user1)
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {  title: "Test test" , description: "test description" } }
      assert_response :redirect
    end

    follow_redirect! 
    assert_response :success
    assert_match "Test test", response.body
  end
end
