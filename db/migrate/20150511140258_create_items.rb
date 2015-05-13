class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.boolean :public, default: true
      t.references :user, index: true

      t.timestamps
    end
    add_foreign_key :items, :users
  end
end
