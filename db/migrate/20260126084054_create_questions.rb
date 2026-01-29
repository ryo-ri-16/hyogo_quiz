class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content
      t.string :image
      t.text :explanation
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
