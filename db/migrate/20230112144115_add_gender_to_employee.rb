class AddGenderToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :gender, :string
  end
end
