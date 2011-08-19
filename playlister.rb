require 'rubygems'
require 'sinatra'
require 'haml'
require 'iconv'

set :haml, :escape_html => true

get '/' do
  haml :index
end


post "/" do
  begin
    f = params[:f]
    @filename = f[:filename]
    body = f[:tempfile].read
    @tracks = Iconv.iconv('utf-8', 'utf-16', body).first.split("\r")
    @tracks.collect!{|t| t.split("\t")}
    @headers = @tracks.shift
    haml :playlist
  rescue => @e
    haml :failure
  end
end