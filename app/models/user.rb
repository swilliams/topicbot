class User < ActiveRecord::Base
  has_many :topics
  has_many :questions
  has_many :votes

  def vote_question_ids
    @vote_question_ids ||= Vote.where(user_id: self.id).pluck(:question_id)
  end

  def twitter_nickname
    "@#{twitter_info["info"]["nickname"]}"
  end

  def twitter_url
    "https://twitter.com/#{twitter_info["info"]["nickname"]}"
  end
end
