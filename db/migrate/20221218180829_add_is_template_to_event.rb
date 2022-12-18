class AddIsTemplateToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :is_template, :bool, null: false, default: false
    execute <<-SQL
      ALTER TABLE events ALTER COLUMN is_template DROP DEFAULT;
    SQL
  end
end
