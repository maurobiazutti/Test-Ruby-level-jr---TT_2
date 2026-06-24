class Prize < ApplicationRecord
  belongs_to :event
  belongs_to :winner, class_name: 'User', optional: true
end
