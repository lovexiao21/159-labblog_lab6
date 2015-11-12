class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.text :content
      t.datetime :post_time

      t.timestamps
    end
  end
end
