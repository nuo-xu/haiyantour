class ConfirmationMailer < ActionMailer::Base
	default from: 'steno_xu@hotmail.com'

	def confirmation_contact(contact)
		@contact = contact
		mail(to: @contact.email, subject: 'Confirmation from Haiyan Tourism')
	end

	def confirmation_admin(contact)
		@contact = contact
		@admin_email = 'stenoxu@gmail.com'
		mail(to: @admin_email, subject: 'You got a new letter from a wesite viewer')
	end
end