class Question < ActiveRecord::Base
  belongs_to :topic, touch: true
  belongs_to :user, touch: true
  has_many :votes

  after_create :vote_for_it

  def self.by_popularity
    order("vote_count DESC")
  end

  def vote_for_it
    self.votes.create(user_id: self.user_id)
  end
end
