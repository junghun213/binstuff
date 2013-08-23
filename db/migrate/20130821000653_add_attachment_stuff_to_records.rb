class AddAttachmentStuffToRecords < ActiveRecord::Migration
  def self.up
    change_table :records do |t|
      t.attachment :stuff
    end
  end

  def self.down
    drop_attached_file :records, :stuff
  end
end
