class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :aws_texts, null: false, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :aws_texts_id], unique: true
  end
end
