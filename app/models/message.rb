class Message < ApplicationRecord
	belongs_to :sender, :class_name=> "User"
	belongs_to :receiver, :class_name =>"User"

	def self.find_by_user(user)
		if user
			@blocked = user.friendships.where(:is_blocked=>'t').map{|friendship| friendship.friend_id}
			if @blocked.present?
		  		where("(receiver_id=?) and (sender_id not in (?))",user.id, @blocked).order("created_at desc")
		  	else
		  		where("receiver_id=?",user.id).order("created_at desc")
		  	end

		end
	end

	def self.find_by_sender(user_id)
		if user_id
		  where("sender_id=?", user_id).order("created_at desc")
		end
	end

	def self.mark_as_read_all(receiver_id)
		where("(receiver_id=?) and (is_read !='f' or is_read is null)",receiver_id).update_all(:is_read => 'true')
	end

	def self.mark_as_read(message)
		message.read_at = Time.now
		message.save
	end
end
