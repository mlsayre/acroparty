require "test_helper"

feature "User update Username" do
  scenario "The member can update their Username" do
    sign_in(:one)
    visit edit_user_registration_path

    #click_link "Sign in"

    # given a complete log in form
    fill_in "Username", with: 'Booga'
    fill_in "Current password", with: 'password'

    click_button "Update"

    # Then I should see success message
    page.text.must_include 'Welcome, Booga!'

  end
end
