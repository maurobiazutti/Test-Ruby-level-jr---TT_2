json.extract! user_award, :id, :user_id, :award_id, :created_at, :updated_at
json.url user_award_url(user_award, format: :json)
