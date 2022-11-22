class CreateFantasies < ActiveRecord::Migration[7.0]
  def change
    create_table :fantasies do |t|
      t.string :character
      t.string :location
      t.string :poem
      t.string :race

      t.timestamps
    end
  end
end
