class CreateRispostes < ActiveRecord::Migration[5.1]
  def change
    create_table :rispostes do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :domande, foreign_key: true

      t.timestamps
    end
  end
end
