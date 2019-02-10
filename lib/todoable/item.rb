module Todoable
    class Item
        ITEM_PATH = "/items/"
        FINISH_PATH = "/finish"

        attr_accessor :list_id, :user

        def initialize(user, list_id)
            @user = user
            @list_id = list_id
        end

        def create(content)
            user.make_request(LISTS_PATH+list_id+ITEM_PATH, :post, { item: {name: content} })
        end

        def finish(item_id)
            user.make_request(LISTS_PATH+list_id+ITEM_PATH+item_id+FINISH_PATH, :put)
        end

        def delete(item_id)
            user.make_request(LISTS_PATH+list_id+ITEM_PATH+item_id, :delete)
        end
    end
end