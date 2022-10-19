class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # Authlogic::ActsAsAuthentic::Email
      t.string :email, index: { unique: true }

      # Authlogic::ActsAsAuthentic::Password
      t.string :crypted_password
      t.string :password_salt

      # Authlogic::ActsAsAuthentic::PersistenceToken
      t.string :persistence_token, index: { unique: true }

      # Authlogic::ActsAsAuthentic::SingleAccessToken
      t.string :single_access_token, index: { unique: true }

      # Authlogic::ActsAsAuthentic::PerishableToken
      t.string :perishable_token, index: { unique: true }

      # See "Magic Columns" in Authlogic::Session::Base
      t.integer   :login_count,        default: 0, null: false
      t.integer   :failed_login_count, default: 0, null: false
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      # See "Magic States" in Authlogic::Session::Base
      t.boolean :active,    default: false
      t.boolean :approved,  default: false
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end