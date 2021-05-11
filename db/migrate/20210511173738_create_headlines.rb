# Headline Data Model
class CreateHeadlines < ActiveRecord::Migration[6.1]
  def change
    create_table :headlines do |t|
      t.string :title
      t.string :article_source
      t.datetime :published_date

      t.timestamps
    end
  end
end
