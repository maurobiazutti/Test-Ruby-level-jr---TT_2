class Award < ApplicationRecord
  has_many :usereventawards
  has_many :events, through: :usereventawards
  has_many :users, through: :usereventawards
end
