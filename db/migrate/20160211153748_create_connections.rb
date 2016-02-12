class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :follower
      t.references :followed

      t.timestamps
    end
  end
end
