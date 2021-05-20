class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text,               null: false
      t.references :user,         foreige_kye: true
      t.references :prototype,    foreige_kye: true
      t.timestamps
    end
  end
end
