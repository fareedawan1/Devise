# frozen_string_literal: true

# adduserIDto post

class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
  end
end
