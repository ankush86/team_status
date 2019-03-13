require 'webmock'

class UserProjectEngageService
  include WebMock::API

  def check(params)
    res = stub_request(:get, "/api/can_assign/#{params[:user_id]}?end_date=#{params[:end_date]}").to_return(body: 'success', status: 200)
    sleep 2
    res.response.body
  end
end
