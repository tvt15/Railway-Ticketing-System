require "application_system_test_case"

class AdminsTest < ApplicationSystemTestCase
  setup do
    @admin = admins(:one)
  end

  test "visiting the index" do
    visit admins_url
    assert_selector "h1", text: "Admins"
  end

  test "should create admin" do
    visit admins_url
    click_on "New admin"

    fill_in "Address", with: @admin.address
    fill_in "Credit number", with: @admin.credit_number
    fill_in "Email", with: @admin.email
    fill_in "Name", with: @admin.name
    fill_in "Password", with: @admin.password
    fill_in "Phone", with: @admin.phone
    fill_in "Username", with: @admin.username
    click_on "Create Admin"

    assert_text "Admin was successfully created"
    click_on "Back"
  end

  test "should update Admin" do
    visit admin_url(@admin)
    click_on "Edit this admin", match: :first

    fill_in "Address", with: @admin.address
    fill_in "Credit number", with: @admin.credit_number
    fill_in "Email", with: @admin.email
    fill_in "Name", with: @admin.name
    fill_in "Password", with: @admin.password
    fill_in "Phone", with: @admin.phone
    fill_in "Username", with: @admin.username
    click_on "Update Admin"

    assert_text "Admin was successfully updated"
    click_on "Back"
  end

  test "should destroy Admin" do
    visit admin_url(@admin)
    click_on "Destroy this admin", match: :first

    assert_text "Admin was successfully destroyed"
  end
end
