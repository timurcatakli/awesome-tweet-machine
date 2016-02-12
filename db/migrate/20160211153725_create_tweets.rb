class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :post, {limit: 140}
      t.references :user

      t.timestamps
    end
  end
end
