class AddDetailsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    add_column :users, :location, :string
    add_column :users, :linkedinImg, :string
    add_column :users, :fbImg, :string
    add_column :users, :linkedinuid, :string
    add_column :users, :fbuid, :string
  end

  def self.down
    remove_column :users, :fbuid
    remove_column :users, :linkedinuid
    remove_column :users, :fbImg
    remove_column :users, :linkedinImg
    remove_column :users, :location
    remove_column :users, :email
    remove_column :users, :last_name
    remove_column :users, :first_name
  end
end
