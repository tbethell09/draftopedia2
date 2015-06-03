class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :team
      t.string :article

      t.timestamps
    end
  end
end
