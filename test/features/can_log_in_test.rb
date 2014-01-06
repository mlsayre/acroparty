require "test_helper"

feature "User Username log in" do
  scenario "The member can log in with Username" do
    visit new_user_session_path

    #click_link "Sign in"

    # given a complete log in form
    fill_in "Username or Email", with: 'User1'
    fill_in "Password", with: 'password'

    click_button "Sign in"

    # Then I should see success message
    page.text.must_include 'Welcome, User1!'

  end
end

feature "User Email log in" do
  scenario "The member can log in with email" do
    visit root_path

    click_link "Sign in"

    # given a complete log in form
    fill_in "Username or Email", with: users(:two).email
    fill_in "Password", with: 'password'

    click_button "Sign in"

    # Then I should see success message
    page.text.must_include 'Welcome, User2!'

  end
end
