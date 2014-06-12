require 'collection_representer'
require 'event_representer'
class EventsRepresenter < CollectionRepresenter
  self.representation_wrap = :events
  # TODO: See if EventRepresenter can be defined inline
  collection :events, decorator: EventRepresenter
end
