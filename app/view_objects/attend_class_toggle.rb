class AttendClassToggle 
  attr_reader :studio, :time, :instructor, :current_user

  def initialize(spin_class, current_user)
    @spin_class = spin_class
    @current_user = current_user
  end

  def already_attending?
    if Attendee.find_by(user_id: current_user.id, spin_class_id: @spin_class.id)
      'unattend_spin_class'
    else
      'attend_spin_class'
    end
  end

end