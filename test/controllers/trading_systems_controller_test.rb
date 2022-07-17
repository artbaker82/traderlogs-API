require "test_helper"

class TradingSystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trading_system = trading_systems(:one)
  end

  test "should get index" do
    get trading_systems_url, as: :json
    assert_response :success
  end

  test "should create trading_system" do
    assert_difference("TradingSystem.count") do
      post trading_systems_url, params: { trading_system: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show trading_system" do
    get trading_system_url(@trading_system), as: :json
    assert_response :success
  end

  test "should update trading_system" do
    patch trading_system_url(@trading_system), params: { trading_system: {  } }, as: :json
    assert_response :success
  end

  test "should destroy trading_system" do
    assert_difference("TradingSystem.count", -1) do
      delete trading_system_url(@trading_system), as: :json
    end

    assert_response :no_content
  end
end
