require 'grape'
require 'json'

require 'api/events_resource'

module API
  class Base < Grape::API
    CONTENT_TYPE = "application/hal+json"
    RACK_CONTENT_TYPE_HEADER = {"content-type" => CONTENT_TYPE}
    HTTP_STATUS_CODES = Rack::Utils::HTTP_STATUS_CODES.invert

    format :json
    cascade false
    content_type :json, CONTENT_TYPE

    rescue_from Grape::Exceptions::Validation do |e|
      Rack::Response.new({ message: e.message }.to_json, 422, RACK_CONTENT_TYPE_HEADER).finish
    end

    # rescue_from ActiveRecord::RecordNotFound do |e|
    #   Rack::Response.new({ message: "The item you are looking for does not exist."}.to_json, 404, RACK_CONTENT_TYPE_HEADER).finish
    # end

    # Mount your api classes here
    mount API::EventsResource
  end
end
