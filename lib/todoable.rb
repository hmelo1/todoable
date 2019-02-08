require "todoable/list"
require "todoable/item"
require "net/http"
require "json"

module Todoable
    BASE_ROUTE = 'http://todoable.teachable.tech/api'
    AUTH_PATH = "/authenticate"
    LISTS_PATH = "/lists" #[GET, POST]
    LIST_PATH = "/lists/:list_id" #[GET, PATCH, DELETE]
    ITEMS_PATH = "/lists/:list_id/items" #[POST]
    ITEM_PATH = "/lists/:list_id/items/:item_id" #[DELETE]
    FINISHED_ITEM_PATH = "/lists/:list_id/items/:item_id/finish" #[DELETE]

    class User
        attr_accessor :username, :password
        
        def self.new_user(username, password)
            user = new
            user.username = username
            user.password = password
            user
        end
    end
end
