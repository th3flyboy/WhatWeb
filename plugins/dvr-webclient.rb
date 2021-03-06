##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DVR-WebClient" do
author "Andrew Horton"
version "0.1"
description "DVR camera"

# Dorks #
dorks [
'intitle:"DVR WebClient"'
]

# Examples #
examples %w|
http://122.160.154.104/
http://125.99.118.103/
http://59.90.207.4/
http://88.249.69.19/
http://195.122.24.206/
http://218.17.150.210/
|

# Matches #
matches [

{:md5=>'8cf9f140f2ec4f5d3e533b5bc2b221ea'},

# clsid
{:text=>'259F9FDF-97EA-4C59-B957-5160CAB6884E'}

]


end

