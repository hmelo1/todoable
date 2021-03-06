# Todoable

Library wrapper to use the Todoable API.

Gem Link: https://rubygems.org/gems/todoable

# Pre-Requisite
Install the gem using bundler

Add to GemFile:
```ruby
gem 'todoable', '~> 1.0', git: 'https://github.com/hmelo1/todoable.git'
```
Run a good ol'fashioned bundle install

# Dependencies
```
Rest-Client
Bundler
Rspec
Rake
```

# Testability
 * Tests currently work for the following methods:
 ```ruby
    Todoable::User.authenticate_user
    Todoable::User.list_lists
    Todoable::User.list_items
    Todoable::List.index
    Todoable::List.show
    Todoable::List.create
    Todoable::List.update
    Todoable::List.delete
 ```

 *Tests DO NOT work for the following methods: 
 ```ruby
    Todoable::Item.create
    Todoable::Item.finish
    Todoable::Item.delete
 ```

# Clases and Modules

`Todoable::User` < Represents the User currently logged in.

`Todoable::List` < Represents the Lists of Todo Lists

`Todoable::Item` < Represents the individual items going into the Todo List

# Adjustments needed
* Currently there are no tests running for the items class. Was unable to figure out how to properly test them within the alloted few hours. 
* Readability within tests could be improved.
* Some error capturing for errors. RestClient handles some, but more error capturing is needed.

# API EndPoints
The base URL for all requests is http://todoable.teachable.tech/api
```
GET /lists
POST /lists
GET /lists/:list_id
PATCH /lists/:list_id
DELETE /lists/:list_id
POST /lists/:list_id/items
PUT /lists/:list_id/items/:item_id/finish
DELETE /lists/:list_id/items/:item_id
```
# Usage and Methods

## Authentication
~~~~~ruby
#Provide Authentication credentials
user = Todoable::User.authenticate_user(username, password)
~~~~~

~~~~~ruby
#Populate your lists of todo-lists
lists = user.list_lists
~~~~~

## Retrieve all lists
~~~~~ruby
#View your list index
lists.index
~~~~~

## Create a new list
~~~~~ruby
#Create a new list with the name "New List"
lists.create("New List")
~~~~~

## Show list given an ID
~~~~~ruby
#Show an individual list
lists.show(list_id)
~~~~~

## Update a list
~~~~~ruby
#Update an individual list
lists.update(list_id)
~~~~~

## Delete a list
~~~~~ruby
#Delete an individual list
lists.delete(list_id)
~~~~~

~~~~~ruby
#Add items to an individual list
item = list_items(list_id)
~~~~~

## Create an item within a TODO List
~~~~~ruby
#Create an item in your chosen list.
item.create("Say hello to the dogs!")
~~~~~

## Mark an item as finished.
~~~~~ruby
#Finish an item
item.finish(item_id)
~~~~~


## Delete an item from your list
~~~~~ruby
#Delete an individual item
item.delete(item_id)
~~~~~





## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/todoable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Todoable project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/todoable/blob/master/CODE_OF_CONDUCT.md).
