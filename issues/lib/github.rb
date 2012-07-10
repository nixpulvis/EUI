require 'net/http'
require 'json'

class User
	attr_accessor :name, :pass

	def initialize( name, pass )
		@name = name
		@pass = pass
	end
end

class Repository 
	attr_accessor :user, :repo
	@@api_url = "api.github.com"

	def initialize( user, repo )
		@user = user
		@repo = repo
	end
	
	def get_issues
		http = Net::HTTP.new(@@api_url,443)
		req = Net::HTTP::Get.new("/repos/#{@user}/#{repo}/issues")
		http.use_ssl = true
		response = http.request(req)
		return JSON.parse response.body
	end

	def post_issue( user, data )
		http = Net::HTTP.new(@@api_url,443)
    req = Net::HTTP::Post.new("/repos/#{@user}/#{repo}/issues")
    http.use_ssl = true
    req.basic_auth user.name, user.pass

    # assure data
    raise('issue data needs title') unless data[:title]
    data[:assignee] ||= 'EUIbugs'
    data[:labels] = ['fromweb'] unless data[:labels]

    req.body = data.to_json
    response = http.request(req)
		return JSON.parse response.body
	end

end