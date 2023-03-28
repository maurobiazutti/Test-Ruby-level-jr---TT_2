class User < ApplicationRecord
  has_many :usereventawards
  has_many :events, through: :usereventawards
  has_many :awards, through: :usereventawards
end
