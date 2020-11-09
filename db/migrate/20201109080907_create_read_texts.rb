class CreateReadTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :read_texts do |t|

      t.timestamps
    end
  end
end
