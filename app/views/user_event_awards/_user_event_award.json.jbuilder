json.extract! user_event_award, :id, :description, :user_id, :event_id, :award_id, :created_at, :updated_at
json.url user_event_award_url(user_event_award, format: :json)
