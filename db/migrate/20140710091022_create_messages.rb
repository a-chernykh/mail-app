class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to_email
      t.string :subject
      t.text :body
      t.string :attachment

      t.boolean :is_draft, default: false
    end
  end
end
