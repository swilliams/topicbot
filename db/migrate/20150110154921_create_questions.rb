class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.boolean :visible, default: true
      t.integer :topic_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
