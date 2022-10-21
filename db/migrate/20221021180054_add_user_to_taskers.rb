class AddUserToTaskers < ActiveRecord::Migration[7.0]
  def change
    add_reference :taskers, :user, foreign_key: true
  end
end
