class DropTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :article_categories do |t|
      t.integer :article_id
      t.integer :category_id
    end
  end
end
