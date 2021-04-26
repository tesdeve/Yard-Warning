class CreateMarshallWarnings < ActiveRecord::Migration[6.1]
  def change
    create_table :marshall_warnings do |t|
      t.string :dsp
      t.string :registration_number
      t.text :fault
      t.text :action_comment
      t.datetime :date

      t.timestamps
    end
  end
end
