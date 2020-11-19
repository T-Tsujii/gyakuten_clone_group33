class CreateReadTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :read_texts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :aws_text, null: false, foreign_key: true
      t.timestamps
    end
    # add_index :read_texts, [:user_id, :movie_id], unique: true
  end
end
