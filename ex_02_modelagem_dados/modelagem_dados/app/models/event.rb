class Event < ApplicationRecord
  has_many :event_participations
  has_many :users, through: :event_participations
  has_many :prizes
end
