require "todoable/list"
require "todoable/item"
require "rest-client"
require "json"

module Todoable
    BASE_ROUTE = 'http://todoable.teachable.tech/api'
    LISTS_PATH = "/lists"

    class User
        AUTH_PATH = "/authenticate"

        attr_accessor :username, :password, :token
        
        def self.authenticate_user(username, password)
            user = new
            user.username = username
            user.password = password
            user.token = self.get_token!(user)
            binding.pry
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
            resp = req.execute {|resp| resp} 
            if resp.code == 401
                return "Unauthorized"
            end 
            resp = JSON.parse(resp)
            
            resp['token']
        end

        def make_request(path, type, values = nil)
            data = {
                method: type,
                url: BASE_ROUTE+path,
                headers: {
                    content_type: :json,
                    accept: :json,
                    authorization: "Token token=\"#{token}\""
                }
            }
            if values
                data.merge!(payload: values.to_json)
            end
            req = RestClient::Request.new(data)
            req = req.execute
            if type != :delete and type != :patch
                resp = JSON.parse(req)
                return resp
            end
        end

        def list_lists
            List.new(self)
        end

        def list_items(list_id)
            Item.new(self, list_id)
        end
    end
end
