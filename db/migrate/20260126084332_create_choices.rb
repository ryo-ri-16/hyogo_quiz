class CreateChoices < ActiveRecord::Migration[8.0]
  def change
    create_table :choices do |t|
      t.references :question, null: false, foreign_key: true
      t.text :content, null: false
      t.boolean :is_correct, default: false, null: false
      t.integer :position

      t.timestamps
    end

    add_index :choices, [ :question_id, :position ]
  end
end
