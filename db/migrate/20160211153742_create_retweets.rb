class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.references :tweet
      t.references :user

      t.timestamps
    end
  end
end
