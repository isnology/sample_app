# == Schema Information
#
# Table name: relationships
#
#  id          :integer(4)      not null, primary key
#  follower_id :integer(4)
#  followed_id :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Relationship < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id
end
