# coding: utf-8
require "net/http"

params = {
  "service"=>"alipay.wap.trade.create.direct",
  "req_data"=> "<direct_trade_create_req><seller_account_name>jilinmei@gmail.com</seller_account_name><out_trade_no>201504225920</out_trade_no><subject>预约课程《初中二年级语文》家教：杨佳鑫</subject><total_fee>35</total_fee><call_back_url>http://www.jiajiaone.com/trades/31</call_back_url><notify_url>http://www.jiajiaone.com/trades/alipay_notify</notify_url></direct_trade_create_req>",
  "partner"=>"2088611537361953",
  "req_id"=>"2015042308121429747962",
  "format"=>"xml",
  "v"=>"2.0",
  "sec_id"=>"MD5",
  "sign"=>"981c42befb6c9f2138e5f8e9cdf1e4e5"}

GATEWAY_URL = 'https://wappaygw.alipay.com/service/rest.htm'

uri = URI(GATEWAY_URL)
uri.query = URI.encode_www_form(params)

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

puts uri.request_uri

response = http.get(uri.request_uri)
xml = response.body

#request = Net::HTTP::Get.new(uri.request_uri)
#response = http.request(request)
#xml = response.body

puts xml

