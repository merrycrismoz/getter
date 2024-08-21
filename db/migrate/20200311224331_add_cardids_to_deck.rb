class AddCardidsToDeck < ActiveRecord::Migration[6.0]
  def change
    add_column :decks, :card_ids, :integer, array: true, default:[]
  end
end
