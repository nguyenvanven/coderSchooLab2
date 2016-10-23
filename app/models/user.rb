class User < ApplicationRecord
	has_many :receive_messages, :class_name=>"Message", :foreign_key=>"receiver_id"
	has_many :send_messages, :class_name=>"Message", :foreign_key =>"sender_id"

	has_many :friendships
	has_many :friends, :through => :friendships
  has_secure_password
  validates :username, presence:true, uniqueness:true
  validates :email, presence:true, uniqueness:{case_insensitive:true}
  validates :password, presence:true
  validates :password_confirmation, presence:true

  def self.users_are_not_already_friends (current_user)
    if current_user.friends.present?
	   User.where("(id not in (?)) and (id != ?)", current_user.friend_ids, current_user.id)
   else
    User.where("(id != ?)", current_user.id)
   end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
