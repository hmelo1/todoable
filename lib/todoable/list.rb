module Todoable
    class List
        attr_accessor :name, :list_id, :user

        def initialize(user)
            @user = user
        end

        def index
            user.make_request(LISTS_PATH, :get)['lists']
        end

        def create(content)
            user.make_request(LISTS_PATH, :post, { list: {name: content} })
        end

        def show(id)
            user.make_request(LISTS_PATH+"/#{id}", :get)
        end

        def update(id, content)
            user.make_request(LISTS_PATH+"/#{id}", :patch, {list: {name: content}} )
        end

        def delete(id)
            user.make_request(LISTS_PATH+"/#{id}", :delete)
        end
    end
end