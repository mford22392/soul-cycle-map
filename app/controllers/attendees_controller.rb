class AttendeesController < ApplicationController
   def create
    @attendee = Attendee.find_or_create_by(user_id: current_user.id, spin_class_id: params[:spin_class_id])
    unattend_button = render_to_string(partial: 'studios/unattend_spin_class', locals: {spin_class: SpinClass.find(params[:spin_class_id])})
    redirect_to current_user
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy
    # attend_button = render_to_string(partial: 'studios/attend_spin_class', locals: {spin_class: SpinClass.find(params[:spin_class_id])})
    redirect_to :back
  end

  private

  def attendee_params
    params.require(:attendee).permit(:spin_class_id, :user_id)
  end
end
