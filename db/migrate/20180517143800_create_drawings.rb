class CreateDrawings < ActiveRecord::Migration[5.2]
  def change
    create_table :drawings do |t|
      t.string :background_color
      t.string :background_effect
      t.string :text_color
      t.string :outline_color
      t.string :outline_width
      t.string :content
      t.string :title
      t.integer :user_id
    end
  end
end
