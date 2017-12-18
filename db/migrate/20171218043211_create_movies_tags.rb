class CreateMoviesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :movies_tags do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
