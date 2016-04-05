class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :commentable, polymorphic: true # commentable_id & commentable_type
      t.timestamps null: false
    end
  end
end
