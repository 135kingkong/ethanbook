require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end
  
  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end
  
  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  
  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:ethan).profile_name
    
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  
  test "a user should have a profile name without spaces" do
    user = User.new(first_name: '`ethan', last_name: 'hill', email: 'ethanblues2@gmail.com')
    user.password = user.password_confirmation = 'billfatttt'
    user.profile_name = "My profile name with spaces"
    
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end
  
  test "a user can have a corretly formatted profile name" do
    user = User.new(first_name: '`ethan', last_name: 'hill', email: 'ethanblues2@gmail.com')
    user.password = user.password_confirmation = 'billfatttt'
    
    user.profile_name = 'ethanhill191'
    assert user.valid?
  end
  
end
