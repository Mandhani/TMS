class AddAttachmentAvatarToTours < ActiveRecord::Migration[5.2]
  def self.up
    change_table :tours do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :tours, :avatar
  end
end
