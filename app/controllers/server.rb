module RushHour
  class Server < Sinatra::Base
    not_found do
      erb :error
    end

    get '/sources' do
      @identifier = params[:identifier]
      @root_url = params[:rootUrl]
      require "pry"; binding.pry
    end
  end
end
