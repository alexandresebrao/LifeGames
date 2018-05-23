class ContactController < ApplicationController
	def show
		@contacts = Contact.all
	end

	def add
		@contact = Contact.new
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def show_admin
		@contacts = Contact.all
	end

	def insert
		@c = Contact.new(contact_params)
		@c.save
		redirect_to admin_show_contacts_path
	end

	def update
		@contact = Contact.find(params[:id])
		@contact = @contact.update(contact_params)
		@contact.save
		redirect_to admin_show_contacts_path
	end
	
	private
	def contact_params
      params.require(:contact).permit(:info, :infotype, :icon)
		
	end
end
