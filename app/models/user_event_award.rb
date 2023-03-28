class UserEventAward < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :award
end
