class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string   :title
      t.text     :ingredients
      t.text     :steps
    end
  end
end
