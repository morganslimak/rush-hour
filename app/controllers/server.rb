module RushHour
  class Server < Sinatra::Base
    not_found do
      erb :error
    end

    post '/sources' do
      @identifier = params[:identifier]
      @root_url = params[:rootUrl]

      if @identifier.nil? || @root_url.nil?
        status 400
        body "Missing Parameters - 400 Bad Request"
      elsif Client.exists?(identifier: @identifier)
        status 403
        body "Identifier Already Exists - 403 Forbidden"
      else
        status 200
        body "Success - {'identifier': #{@identifier}}"
        Client.create(identifier: @identifier, root_url: @root_url)
      end
    end

    post '/sources/:identifier/data' do
      if params[:payload].nil?
        status 400
        body 'Missing Payload - 400 Bad Request'
      elsif !Client.exists?(identifier: params[:identifier])
        status 403
        body 'Application Not Registered - 403 Forbidden'
      else
        payload = PayloadParser.parser(params[:payload])
        client = Client.find_by identifier: params[:identifier]
        client.payloads.create(payload)
        status 200
        body 'Success - 200 OK'
      end
    end

  end
end
