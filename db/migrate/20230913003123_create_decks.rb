class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :card_limit, default: 100
      t.text :card_ids, array: true, default: []

      t.timestamps
    end
  end
end
