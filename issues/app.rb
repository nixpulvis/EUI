require 'sinatra/base'
require 'sinatra/assetpack'
require 'erb'
require_relative 'lib/github'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  # Asset Pack.
  register Sinatra::AssetPack
  assets do
    serve '/js',     from: 'app/js'
    serve '/css',    from: 'app/css'

    css :app, ['/css/*.css']
    js :app,  ['/js/*.js']
  end

  user = User.new('EUIbugs', 'EUIbugs1')
  testbugs = Repository.new('EUIbugs', 'testbugs')
  eui = Repository.new('Epicgrim', 'EUI')

  get '/' do
    erb :index, locals: { 
      issues: eui.get_issues,
      submitted: params['submitted'],
    }
  end

  post '/' do
    # params is the right format for .post_issue :)
    testbugs.post_issue( user, params )
    redirect to('?submitted=true')
  end
end