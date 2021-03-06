##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Posterous" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-19
version "0.1"
description "Posterous publishing platform. If you can email, you can manage a website and share it with small groups or the world using Posterous. - https://posterous.com/"

# ShodanHQ results as at 2011-05-19 #
# 13 for _sharebymail_session_id

# Examples #
examples %w|
66.252.2.41
67.207.139.81
184.106.20.101
66.216.125.32
184.106.20.100
74.205.65.180
209.20.70.130
1337.posterous.com
blog.posterous.com
help.posterous.com
pre.posterous.com
jesus.posterous.com
god.posterous.com
asdf.posterous.com
qwerty.posterous.com
wwww.posterous.com
administrator.posterous.com
fbi.posterous.com
|

# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="Posterous" />' },

# div class "posterous_site_data"
{ :text=>'<div class="posterous_site_data" data-post-id="' },

# Account Detection
{ :account=>/<meta property="og:site_name" content="([^"]+)'s posterous" \/>/ },

# Protected Page
{ :text=>'<li class="first"><a href="http://posterous.com/login?jumpto=http' },

# Redirect Page
{ :regexp=>/<html><body>You are being <a href="http:\/\/([^"]+)\.posterous\.com\/">redirected<\/a>\.<\/body><\/html>/ },

]

# Passive #
def passive
	m=[]

	# _sharebymail_session_id cookie
	m << { :name=>"_sharebymail_session_id cookie" } if @headers["set-cookie"] =~ /^_sharebymail_session_id=/

	# x-posteroushostname header
	m << { :name=>"x-posteroushostname header" } unless @headers["x-posteroushostname"].nil?

	# Return passive matches
	m
end

end

