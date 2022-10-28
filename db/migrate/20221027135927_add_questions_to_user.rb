class AddQuestionsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :question1, :string
    add_index :users, :question1
    add_column :users, :answer1, :string
    add_index :users, :answer1
    add_column :users, :question2, :string
    add_index :users, :question2
    add_column :users, :answer2, :string
    add_index :users, :answer2
  end
end
