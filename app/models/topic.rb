class Topic < ActiveRecord::Base
  belongs_to :user, touch: true
  has_many :questions
  
  scope :visible, -> { where(visible: true) }
end
