require "test_helper"

describe HomeController do
  it "should get index" do
    get home_index_url
    value(response).must_be :success?
  end

end
