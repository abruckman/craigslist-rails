class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.float :price
      t.string :email
      t.text :body
      t.string :location
      t.string :secret_key
      t.references :category, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
