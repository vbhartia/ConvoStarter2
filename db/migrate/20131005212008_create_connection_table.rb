class CreateConnectionTable < ActiveRecord::Migration
  def up
    create_table :connections do |t|
      t.belongs_to :user
      t.timestamps
  	end

  	add_column :connections, :lat, :float
  	add_column :connections, :long, :float
  


  end

  def down
  	drop_table :connections
  end
end
