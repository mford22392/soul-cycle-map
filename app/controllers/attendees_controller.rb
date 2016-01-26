class AttendeesController < ApplicationController
  def create
    @attendee = Attendee.find_or_create_by(user_id: current_user.id, spin_class_id: params[:spin_class_id])
    spin_class = SpinClass.find(params[:spin_class_id])
    attend_button = render_to_string(partial: "studios/unattend_spin_class", locals: {spin_class: SpinClass.find(params[:spin_class_id])})
    selected_class = render_to_string(partial: "/studios/selected_class", locals: {spin_class: spin_class})
    other_attendees = render_to_string(partial: "/spin_classes/other_attendees", locals: {spin_class: spin_class})
    render json: {attend_button: attend_button, current_user: current_user, selected_class: selected_class, spin_class_id: spin_class.id, other_attendees: other_attendees}
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    @spin_class = @attendee.spin_class
    @attendee.destroy
    unattend_button = render_to_string(partial: "studios/attend_spin_class", locals: {spin_class: @spin_class})
    render json: {unattend_button: unattend_button, current_user: current_user, spin_class_id: @spin_class.id}
  end

  private

  def attendee_params
    params.require(:attendee).permit(:spin_class_id, :user_id)
  end
end
