require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "that /sign-in route opens the sign in page" do
    get'/sign-in'
    assert_response :success
  end
  
  test "that /logout route opens the log out page" do
    get'/logout'
    assert_response :redirect
    assert_redirected_to '/'
  end
  
  test "that /register route opens the sign page" do
    get'/register'
    assert_response :success
  end

  test "that a profile page works" do
    get '/135kingkong'
    assert_response :success
  end

end
