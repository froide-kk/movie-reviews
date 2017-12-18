class MigrationTag < ApplicationRecord
  self.table_name = :tags
end

class AddDefaultDataToTags < ActiveRecord::Migration[5.0]
  def up
    %w[Action Adventure Comedy Crime Drama].each do |word|
      MigrationTag.create(name: word)
    end
  end
end
