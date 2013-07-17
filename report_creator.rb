require 'fileutils'
require 'date'

FileUtils.cp( "template.md", "#{Date.today.to_s}.md" )
