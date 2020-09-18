class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string 'title'
      t.string 'author', :limit => 50
      t.string 'genre', :limit => 25
      t.money 'price'
      t.datetime 'publish_date'

      t.timestamps
    end
  end
end
