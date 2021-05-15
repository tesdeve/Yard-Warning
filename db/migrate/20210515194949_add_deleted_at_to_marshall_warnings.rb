class AddDeletedAtToMarshallWarnings < ActiveRecord::Migration[6.1]
  def change
    add_column :marshall_warnings, :deleted_at, :datetime
    add_index :marshall_warnings, :deleted_at
  end
end
