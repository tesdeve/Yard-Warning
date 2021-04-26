require "application_system_test_case"

class MarshallWarningsTest < ApplicationSystemTestCase
  setup do
    @marshall_warning = marshall_warnings(:one)
  end

  test "visiting the index" do
    visit marshall_warnings_url
    assert_selector "h1", text: "Marshall Warnings"
  end

  test "creating a Marshall warning" do
    visit marshall_warnings_url
    click_on "New Marshall Warning"

    fill_in "Action comment", with: @marshall_warning.action_comment
    fill_in "Date", with: @marshall_warning.date
    fill_in "Dsp", with: @marshall_warning.dsp
    fill_in "Fault", with: @marshall_warning.fault
    fill_in "Registration number", with: @marshall_warning.registration_number
    click_on "Create Marshall warning"

    assert_text "Marshall warning was successfully created"
    click_on "Back"
  end

  test "updating a Marshall warning" do
    visit marshall_warnings_url
    click_on "Edit", match: :first

    fill_in "Action comment", with: @marshall_warning.action_comment
    fill_in "Date", with: @marshall_warning.date
    fill_in "Dsp", with: @marshall_warning.dsp
    fill_in "Fault", with: @marshall_warning.fault
    fill_in "Registration number", with: @marshall_warning.registration_number
    click_on "Update Marshall warning"

    assert_text "Marshall warning was successfully updated"
    click_on "Back"
  end

  test "destroying a Marshall warning" do
    visit marshall_warnings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Marshall warning was successfully destroyed"
  end
end
