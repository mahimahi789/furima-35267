class Address < ApplicationRecord
  has_one :buy_manage
  has_one :user
end
