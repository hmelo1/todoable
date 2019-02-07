module Todoable
    class List
        def self.portray(food)
            if food.downcase == "broccoli"
                "Gross!"
            else
                "Delicious!"
            end
        end
    end
end