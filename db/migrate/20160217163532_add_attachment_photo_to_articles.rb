class AddAttachmentPhotoToArticles < ActiveRecord::Migration
  def up
    change_table :articles do |t|
      add_attachment :articles, :photo
    end
  end

  def down
    remove_attachment :articles, :photo
  end
end
