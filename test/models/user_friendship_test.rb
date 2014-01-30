require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase

	should belong_to(:user)
	should belong_to(:friend)


	test "creating a friendship works without raising an exception"  do
		assert_nothing_raised do
			UserFriendship.create user: users(:ethan), friend: users(:mike)
		end
		
	end

	test "that creating a friendship based on  user id and friend id works" do
		UserFriendship.create user_id: users(:ethan).id, friend_id: users(:mike).id
		assert users(:ethan).friends.include?(users(:mike))
	end

end
