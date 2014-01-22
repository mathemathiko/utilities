require 'fileutils'
require 'date'

require 'rubygems'
gem "activesupport", "2.3.12"
require 'active_support'
require 'active_support/core_ext/date/calculations'

today     = Date.today
year      = today.year.to_s
month     = today.month.to_s.rjust(2, '0')
month_ago = today.prev_month.month.to_s.rjust(2, '0')

directory_from = year
directory_to   = "#{year}/#{year}#{month}"

path_from_month_ago = "#{directory_from}/#{year}#{month_ago}.md"
path_from           = "#{directory_from}/#{year}#{month}.md"
path_to             = "#{directory_to}/#{today.strftime '%Y%m%d'}.md"

directories = [directory_from, directory_to]
directories.each do |directory|
  FileUtils.mkdir_p directory unless FileTest.exist? directory
end

unless FileTest.exist? path_from
  FileUtils.cp( path_from_month_ago , path_from )
end

FileUtils.cp( path_from, path_to )

cmd = "cp #{path_from} #{path_to}"
STDOUT.puts cmd
