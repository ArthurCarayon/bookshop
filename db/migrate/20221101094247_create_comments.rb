class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :author
      t.string :author_email
      t.integer :book_id

      t.timestamps
    end
  end
end
