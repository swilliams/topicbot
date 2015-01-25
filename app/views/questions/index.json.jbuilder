json.array!(@questions) do |question|
  json.extract! question, :id, :body, :visible, :topic_id, :user_id
  json.url topic_question_url(@topic, question, format: :json)
end
