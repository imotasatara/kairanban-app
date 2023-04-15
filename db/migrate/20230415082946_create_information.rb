class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string     :title,    nul: false 
      t.text       :content,  nul: false
      t.references :user,     nul: false, foreign_key: true
      t.timestamps
    end
  end
end
