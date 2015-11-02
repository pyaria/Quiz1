class Addcolumns < ActiveRecord::Migration
  def change
    add_column(:requests, :name, :string)
    add_column(:requests, :email, :string)
    add_column(:requests, :department, :string)
    add_column(:requests, :message, :text)
  end
end
