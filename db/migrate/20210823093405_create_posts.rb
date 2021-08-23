class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text       :title,      null: false
      t.text       :workout,    null: false
      t.text       :meal,       null: false
      t.integer    :sex_id,     null: false
      t.integer    :age_id,     null: false
      t.integer    :style_id,   null: false
      t.integer    :purpose_id, null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
