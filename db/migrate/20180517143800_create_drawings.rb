class CreateDrawings < ActiveRecord::Migration[5.2]
  def change
    create_table :drawings do |t|
      t.string :content
      t.string :title
      t.integer :user_id
      t.integer :theme_id
    end
  end
end
