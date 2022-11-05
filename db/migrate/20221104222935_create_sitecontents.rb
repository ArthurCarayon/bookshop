class CreateSitecontents < ActiveRecord::Migration[7.0]
  def change
    create_table :sitecontents do |t|
      t.string :title_site
      t.string :subtitle_site
      t.text :description_site
      t.text :text_rc

      t.timestamps
    end
  end
end
