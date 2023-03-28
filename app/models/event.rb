class Event < ApplicationRecord
  has_many :usereventawards
  has_many :awards, through: :usereventawards
  has_many :users, through: :usereventawards
end
