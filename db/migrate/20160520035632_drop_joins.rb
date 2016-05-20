class DropJoins < ActiveRecord::Migration
  def change
  	drop_table(:joins)
  end
end
