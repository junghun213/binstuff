class Record < ActiveRecord::Base
  belongs_to :user
  has_attached_file :stuff

  validates :stuff, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :stuff

def self.search(search)
  	if search
    	where('stuff_file_name LIKE ? OR description LIKE ? OR id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  	else
    	scoped
  	end
end

end
