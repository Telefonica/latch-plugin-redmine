class CreateLatchAccounts < ActiveRecord::Migration
  def change
    create_table :latch_accounts do |t|
      t.integer :user_id
      t.string :account_id
    end
  end
end
