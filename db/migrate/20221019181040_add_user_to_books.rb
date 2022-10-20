class AddUserToBooks < ActiveRecord::Migration[7.0]
  def change
    ## needhelp c'est quoi foreign_key? et index n'est pas utile?
    add_reference :books, :user, null: false, foreign_key: true
  end
end
