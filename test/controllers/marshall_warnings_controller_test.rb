require "test_helper"

class MarshallWarningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marshall_warning = marshall_warnings(:one)
  end

  test "should get index" do
    get marshall_warnings_url
    assert_response :success
  end

  test "should get new" do
    get new_marshall_warning_url
    assert_response :success
  end

  test "should create marshall_warning" do
    assert_difference('MarshallWarning.count') do
      post marshall_warnings_url, params: { marshall_warning: { action_comment: @marshall_warning.action_comment, date: @marshall_warning.date, dsp: @marshall_warning.dsp, fault: @marshall_warning.fault, registration_number: @marshall_warning.registration_number } }
    end

    assert_redirected_to marshall_warning_url(MarshallWarning.last)
  end

  test "should show marshall_warning" do
    get marshall_warning_url(@marshall_warning)
    assert_response :success
  end

  test "should get edit" do
    get edit_marshall_warning_url(@marshall_warning)
    assert_response :success
  end

  test "should update marshall_warning" do
    patch marshall_warning_url(@marshall_warning), params: { marshall_warning: { action_comment: @marshall_warning.action_comment, date: @marshall_warning.date, dsp: @marshall_warning.dsp, fault: @marshall_warning.fault, registration_number: @marshall_warning.registration_number } }
    assert_redirected_to marshall_warning_url(@marshall_warning)
  end

  test "should destroy marshall_warning" do
    assert_difference('MarshallWarning.count', -1) do
      delete marshall_warning_url(@marshall_warning)
    end

    assert_redirected_to marshall_warnings_url
  end
end
