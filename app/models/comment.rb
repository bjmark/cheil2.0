#encoding=utf-8
class Comment < ActiveRecord::Base
  validates_presence_of :content,:message=>'不可为空'

  belongs_to :user

  def check_destroy_right(a_user)
    return true if can_del_by?(a_user)
    raise SecurityError  
  end
  
  def can_del_by?(a_user)
    user_id == a_user.id
  end
end

