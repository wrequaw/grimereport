class Grime < ApplicationRecord
  belongs_to :user
  belongs_to :reporter, class_name: :User, foreign_key: 'reported_by_id', optional: true
  validates :user, presence: true
  after_save :update_user_griminess

  def update_user_griminess
    user.griminess = user.grimes.sum(:griminess) # update user griminess as sum of it's all grimes' griminess 
    user.save
  end  
end
