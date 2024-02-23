# frozen_string_literal: true

class CreateNotificationPolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :notification_policies do |t|
      t.references :account, null: false, foreign_key: true, index: { unique: true }
      t.boolean :filter_everyone, null: false, default: false
      t.boolean :filter_not_following, null: false, default: false
      t.boolean :filter_not_followers, null: false, default: false
      t.boolean :filter_new_accounts, null: false, default: false

      t.timestamps
    end
  end
end
