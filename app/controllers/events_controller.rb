class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.create(event_params)
    if event
      not_texted_numbers = []
      message = Message.new_event(event)
      sms_client = SMS.new
      Goon.all.each do |goon|
        not_texted_numbers << sms_client.deliver(goon.phone, message)
      end
      if not_texted_numbers.count > 0
        flash[:sms_number_error] = "Your text did not send to the following number(s) #{not_texted_numbers}"
      end
    end
      redirect_to event, notice: "Your Goon event has been created. Goon on"
  end
  
  def show
    @event = Event.find(params[:id])
  end
  

  private
  def event_params
    params.require(:event).permit(:location, :name)
  end
end
