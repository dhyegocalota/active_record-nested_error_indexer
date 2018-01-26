# ActiveRecord Nested Error Indexer
In Rails 5, we have the option `index_errors: true` to output the nested item index for errors like this:

```ruby
class Order < ApplicationRecord
  has_many :items, index_errors: true

  accepts_nested_attributes_for :items
end

order = Order.create(items_attributes: [{ price: 1 }, { price: -1 }])
order.errors # #<ActiveModel::Errors... @messages={:*"items[1].price"*: ["must be greater than 0"]}>
```

BUT IT DOESN'T WORK FOR RAILS 4, so... *let's monkey patch it :)*

## Installation
Include to your Gemfile
```ruby
gem 'active_record-nested_error_indexer'
```

## Maintainer
[Dhyego Fernando](https://github.com/dhyegofernando)
