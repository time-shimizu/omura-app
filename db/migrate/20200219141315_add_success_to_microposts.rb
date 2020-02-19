class AddSuccessToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :success, :boolean, default: false
  end
end
