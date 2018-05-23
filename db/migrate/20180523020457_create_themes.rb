class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name
      t.string :font
      t.string :text_color
      t.string :text_shadow_color
      t.string :background_color
      t.string :background_image
      t.string :background_animation
    end
  end
end
