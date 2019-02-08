require "todoable/list"
require "todoable/item"
require "net/http"
require "rest-client"
require "json"

require 'pry'

module Todoable
    BASE_ROUTE = 'http://todoable.teachable.tech/api'

    class User
        AUTH_PATH = "/authenticate"

        attr_accessor :username, :password, :token
        
        def self.authenticate_user(username, password)
            user = new
            user.username = "heriberto@melo.nyc" #username
            user.password = "todoable" #password
            user.token = self.get_token!(client)
            user
        end

        def self.get_token!(client)
            req = RestClient::Request.new(
                method: :post,
                url: BASE_ROUTE+AUTH_PATH,
                user: client.username,
                password: client.password,
                headers: {
                    content_type: :json,
                    accept: :json
                }
            )
            resp = JSON.parse(req.execute)
            
            resp['token']
        end

        def make_request()

        end

        def list_lists
            List.new(self)
        end
    end
end
