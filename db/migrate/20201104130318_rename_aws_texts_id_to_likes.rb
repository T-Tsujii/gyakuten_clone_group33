class RenameAwsTextsIdToLikes < ActiveRecord::Migration[6.0]
  def change
    remove_index :likes, [:user_id, :aws_texts_id]
    rename_column :likes, :aws_texts_id, :aws_text_id
    add_index :likes, [:user_id, :aws_text_id], unique: true
  end
end
