class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    # TODO: trigger the mailer to send email to both contact and admin
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_url, notice: 'Thank you for submitting your letter. We will contact you shortly.' }
      else
        format.html { redirect_to root_url, notice: 'Had an issue for submitting!' }
      end
    end
  end

    # TODO: check the cases of different inputs parameters 
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :telephone, :company, :kind, :content, :heard_about_us)
    end
end
