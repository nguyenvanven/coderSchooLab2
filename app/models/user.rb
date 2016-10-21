class User < ApplicationRecord
	has_many :receive_messages, :class_name=>"Message", :foreign_key=>"receiver_id"
	has_many :send_messages, :class_name=>"Message", :foreign_key =>"sender_id"
  has_secure_password
  validates :username, presence:true, uniqueness:true
  validates :email, presence:true, uniqueness:{case_insensitive:true}
  validates :password, presence:true
  validates :password_confirmation, presence:true
end
