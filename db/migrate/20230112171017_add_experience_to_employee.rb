class AddExperienceToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :experience, :integer
  end
end
