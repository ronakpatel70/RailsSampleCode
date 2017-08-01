require 'net/http'
require 'uri'
require 'open-uri'
require 'phantomjs'
class WelcomeController < ApplicationController
  
  def index

  end

  def get_data
  	begin
      page_content = open(params["url"])

      doc = Nokogiri::HTML(page_content)
      @img_srcs = doc.css('img').map{ |i| [i['alt'],i['src']] }
      @js_scripts = doc.css('script').map{ |i| i['src'] }.compact
      @style_css = doc.css('link').map{ |i| i['rel'] == "stylesheet" ? i['href'] : nil }.compact

      respond_to do |format|
        format.js {}
      end
    rescue Exception => e
      respond_to do |format|
        format.js {}
      end
    end
  end
end
