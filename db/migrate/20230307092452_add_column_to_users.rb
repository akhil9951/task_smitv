class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :required, :string
    add_column :users, :avatar_url, :string
    add_column :users, :provider, :string

  end
end
