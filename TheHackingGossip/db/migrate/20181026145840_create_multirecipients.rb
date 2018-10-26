class CreateMultirecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :multirecipients do |t|
      t.references :user, foreign_key: true, index: true
      t.references :private_message, foreign_key: true, index: true
      t.timestamps
    end
  end
end
