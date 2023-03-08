class ChangeDataTypeForPrice < ActiveRecord::Migration[6.0]
  def change
    def self.up
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end
  def self.down
    change_table :products do |t|
      t.change :price, :string
    end
  end
end
