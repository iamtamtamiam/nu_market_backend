class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :phone
      t.string :message
      t.belongs_to :listing, null: false, foreign_key: true
      t.belongs_to :buyer

      t.timestamps
    end
  end
end
