class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.integer :owner
      t.integer :report, default:0
      t.references :post, index: true
      t.timestamps
    end
  end
end
