class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
     #add
      t.string "password"
      t.string "provider"
      t.string "token"
      t.string "uid"
      t.string "meta"
      t.string "reset_password_token"
      t.string "reset_password_sent_at"
      t.string "remember_created_at"
      ## Trackable
      t.integer  "sign_in_count", default: 0, null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
    end
  end
end
