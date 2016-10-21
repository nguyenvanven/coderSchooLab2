class Message < ApplicationRecord
	belongs_to :sender, :class_name=> "User"
	belongs_to :receiver, :class_name =>"User"

	def self.find_by_sender(user_id)
		if user_id
		  where("(sender_id=?) or (receiver_id=?)",user_id, user_id).order("created_at desc")
		end
	end
end
