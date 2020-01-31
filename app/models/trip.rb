class Trip < ApplicationRecord
  def initialize(city)
    @city = city
    @api_auth_header = ""
  end

  def self.api_login
  email = ENV["EMAIL"]
  password = ENV["PASSWORD"]
    response = HTTParty.post('http://localhost:3001/authenticate/', {
      body: "email=#{email}&password=#{password}",
      headers: {
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
      })
    bearer_token = JSON.parse(response.body)['auth_token']
    @api_auth_header = {"Authorization" => "Bearer #{bearer_token}"}
  end

  def self.get_locations
    response = HTTParty.get('http://localhost:3001/locations', {
      headers: @api_auth_header
      })
  end

  def self.search(search)
    if search != nil
    response = HTTParty.get("http://localhost:3001/locations?search=#{search}", {
      headers: @api_auth_header
      })
    end
  end



end
