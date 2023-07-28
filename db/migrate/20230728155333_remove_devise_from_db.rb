class RemoveDeviseFromDb < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :reset_password_token
    remove_index :users, :confirmation_token
    remove_index :users, :unlock_token

    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :remember_created_at
    remove_column :users, :sign_in_count
    remove_column :users, :current_sign_in_at
    remove_column :users, :last_sign_in_at
    remove_column :users, :current_sign_in_ip
    remove_column :users, :last_sign_in_ip
    remove_column :users, :confirmation_token
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
    remove_column :users, :unconfirmed_email
    remove_column :users, :failed_attempts
    remove_column :users, :unlock_token
    remove_column :users, :locked_at

    # remove_index :admins, :reset_password_token
    # remove_index :admins, :confirmation_token
    # remove_index :admins, :unlock_token

    # remove_column :admins, :reset_password_token
    # remove_column :admins, :reset_password_sent_at
    # remove_column :admins, :remember_created_at
    # remove_column :admins, :sign_in_count
    # remove_column :admins, :current_sign_in_at
    # remove_column :admins, :last_sign_in_at
    # remove_column :admins, :current_sign_in_ip
    # remove_column :admins, :last_sign_in_ip
    # remove_column :admins, :confirmation_token
    # remove_column :admins, :confirmed_at
    # remove_column :admins, :confirmation_sent_at
    # remove_column :admins, :unconfirmed_email
    # remove_column :admins, :failed_attempts
    # remove_column :admins, :unlock_token
    # remove_column :admins, :locked_at
  end
end
