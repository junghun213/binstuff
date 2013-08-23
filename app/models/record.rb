class Record < ActiveRecord::Base
  belongs_to :user
  has_attached_file :stuff

def self.search(search)
  	if search
    	where('stuff_file_name LIKE ? OR description LIKE ? OR id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  	else
    	scoped
  	end
end

end
