class User < ApplicationRecord
  has_many :event_participations
  has_many :events, through: :event_participations

  has_many :won_prizes, class_name: 'Prize', foreign_key: 'winner_id'
end
