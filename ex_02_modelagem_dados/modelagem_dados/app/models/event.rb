class Event < ApplicationRecord
  has_many :event_participations
  has_many :users, through: :event_participations
  has_many :prizes, dependent: :destroy

  # Validações básicas
  validates :title, :date, presence: true
end
