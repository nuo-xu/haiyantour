class Contact < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :telephone, presence: true
	validates :content, presence: true
end