class AddDefaultColumn < ActiveRecord::Migration[7.1]
  def change
    change_column :answers,:is_true,:boolean,default: false
  end
end
