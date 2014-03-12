class AddIpAddressToVotes < ActiveRecord::Migration

  def change  
	  # Add a field to story ip address
	  add_column :votes, :ip_address, :string  
  end

end
