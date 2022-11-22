require "test_helper"

class FantasiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fantasy = fantasies(:one)
  end

  test "should get index" do
    get fantasies_url, as: :json
    assert_response :success
  end

  test "should create fantasy" do
    assert_difference("Fantasy.count") do
      post fantasies_url, params: { fantasy: { character: @fantasy.character, location: @fantasy.location, poem: @fantasy.poem, race: @fantasy.race } }, as: :json
    end

    assert_response :created
  end

  test "should show fantasy" do
    get fantasy_url(@fantasy), as: :json
    assert_response :success
  end

  test "should update fantasy" do
    patch fantasy_url(@fantasy), params: { fantasy: { character: @fantasy.character, location: @fantasy.location, poem: @fantasy.poem, race: @fantasy.race } }, as: :json
    assert_response :success
  end

  test "should destroy fantasy" do
    assert_difference("Fantasy.count", -1) do
      delete fantasy_url(@fantasy), as: :json
    end

    assert_response :no_content
  end
end
