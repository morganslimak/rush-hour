module PayloadParser
  extend self

  def parser(payload)
    parsed_payload = JSON.parse(payload)
    build_payload(parsed_payload)
  end

  def build_payload(pp)
    payload = {"url_id" => add_url(pp["url"]).id,
               "requested_at" => pp["requestedAt"],
               "responded_in" => pp["respondedIn"],
               "referred_by_id" => add_referred_by(pp["referredBy"]).id,
               "request_type_id" => add_request_type(pp["requestType"]).id,
               "event_name_id" => add_event_name(pp["eventName"]).id,
               "user_agent_id" => add_user_agent(pp["userAgent"]).id,
               "resolution_id" => add_resolution(pp["resolutionWidth"], pp["resolutionHeight"]).id,
               "ip_id" => add_ip(pp["ip"]).id}
  end

  def add_url(params)
    Url.find_or_create_by(url: params)
  end

  def add_referred_by(params)
    ReferredBy.find_or_create_by(referred_by: params)
  end

  def add_request_type(params)
    RequestType.find_or_create_by(request_type: params)
  end

  def add_event_name(params)
    EventName.find_or_create_by(event_name: params)
  end

  def add_user_agent(params)
    UserAgent.find_or_create_by(user_agent: params)
  end

  def add_resolution(params_w, params_h)
    Resolution.find_or_create_by(resolution_width: params_w, resolution_height: params_h)
  end

  def add_ip(params)
    Ip.find_or_create_by(ip: params)
  end

end
