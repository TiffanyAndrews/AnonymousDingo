class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.create(event_params)
    if event
      message = Message.new_event(event)
      sms_client = SMS.new
      Goons.all.each do |goon|
        sms_client.deliver(goon.phone, message)
      end
      redirect_to root_path
    end
  end

  private
  def event_params
    params.require(:event).permit(:location, :name)
  end
end
