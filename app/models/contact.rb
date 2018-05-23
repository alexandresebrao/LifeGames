class Contact < ActiveRecord::Base
	mount_uploader :icon, ContacticonUploader
end
