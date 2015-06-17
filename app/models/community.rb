class Community < ActiveRecord::Base
  has_ancestry
  acts_as_list :scope => 'ancestry = \'#{ancestry}\''
  scope :ordered, :order => "ancestry_depth,position DESC"
  acts_as_nested_set
  validates :name, :email, :purpose, :activity, :end_date, :leader, :presence => true

  def move_to_left_of(reference_instance)
	transaction do
	  remove_from_list
	  reference_instance.reload # Things have possibly changed in the list
	  self.update_attributes!(:parent_id => reference_instance.parent_id)
	  reference_item_position = reference_instance.position
	  increment_positions_on_lower_items(reference_item_position)
	  self.update_attribute(:position, reference_item_position)
	end
  end

  def move_to_right_of(reference_instance)
  	transaction do
  	  remove_from_list
  	  reference_instance.reload # Things have possibly change in this list
  	  self.update_attributes!(:parent_id => reference_instance.parent_id)
  	  if reference_instance.lower_item
        lower_item_position = reference_instance.lower_item.position
        increment_positions_on_lower_items(lower_item_position)
        self.update_attribute(:position, lower_item_position)
      else
        add_to_list_bottom
        save!
      end
    end   
  end
end
