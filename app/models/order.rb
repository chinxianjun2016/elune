class Order < ApplicationRecord
  belongs_to :team
  has_many :items
end
