class Subscriber < ActiveRecord::Base
	validates :email_address, presence: true
end