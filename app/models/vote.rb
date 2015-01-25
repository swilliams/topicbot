class Vote < ActiveRecord::Base
  belongs_to :question, counter_cache: :vote_count, touch: true
  belongs_to :user, touch: true
  validates :question_id, uniqueness: { scope:  :user_id }
end

