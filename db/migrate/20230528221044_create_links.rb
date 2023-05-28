class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :original_url, null: false
      t.string :slug, null: false
    end
  end
end
