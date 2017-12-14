class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name, null: false, index: { unique: true }
      t.decimal :rating, null: false, precision: 2, scale: 1

      t.timestamps
    end
  end
end
