class RemoveVisibleFromQuestionsDumbIdea < ActiveRecord::Migration
  def change
    remove_column :questions, :visible
  end
end
