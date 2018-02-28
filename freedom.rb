require 'sinatra'
require 'yaml/store'

get '/' do
	erb :index
end

post '/cast' do
	@store = YAML::Store.new "messages.yml"
	@name = params['name_area']
	@message = params['message_area']
	@date = DateTime.now
	@date.strftime("%m/%d/%Y,%I:%M:%L")
	@store.transaction do
		@store[@date] ||= {@name => @message}
	end
	erb :index
end