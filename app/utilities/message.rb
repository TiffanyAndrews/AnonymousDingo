class Message
  def self.new_event(event)
    "RSVP to my shit #{event.name} at #{event.location}"
  end
end
