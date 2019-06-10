require 'test_helper'

class Api::V1::Services::UrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_services_url = api_v1_services_urls(:one)
  end

  test "should get index" do
    get api_v1_services_urls_url, as: :json
    assert_response :success
  end

  test "should create api_v1_services_url" do
    assert_difference('Api::V1::Services::Url.count') do
      post api_v1_services_urls_url, params: { api_v1_services_url: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_services_url" do
    get api_v1_services_url_url(@api_v1_services_url), as: :json
    assert_response :success
  end

  test "should update api_v1_services_url" do
    patch api_v1_services_url_url(@api_v1_services_url), params: { api_v1_services_url: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_services_url" do
    assert_difference('Api::V1::Services::Url.count', -1) do
      delete api_v1_services_url_url(@api_v1_services_url), as: :json
    end

    assert_response 204
  end
end
