#!/usr/bin/env ruby
require 'optparse'

# target file
file_path = nil

# directory for output
dest_dir  = nil

# division unit(line)
line_size = 4500

OptionParser.new {|opt|
  opt.on('-f', '--file file_path', String, "分割したいテキストファイル"){|v|
    file_path = File.expand_path(v)
  }
  opt.on('-d', '--dest dest_dir', String, "分割したファイルを作成したいディレクトリ"){|v|
    dest_dir = File.expand_path(v)
  }
  opt.on('-l', '--line line_size', Integer, "分割単位(デフォルト => #{line_size}行)"){|v|
    line_size = v
  }
  opt.parse!(ARGV)
}

# will be end if we have not target file
exit 1 if file_path.nil?

# if we have not directory for output, we output to directory for input
dest_dir  = File.dirname(file_path) if dest_dir.nil?
dest_dir += "/" + File.basename(file_path, File.extname(file_path))
ext_name  = File.extname(file_path)
lines     = 0

open(file_path) {|file|
  while line = file.gets
    begin
      dest_file = dest_dir + "_" + (lines / line_size).to_s + ext_name
      dest      = open(dest_file, "a") if dest.nil? || dest.closed?
      dest.write line
      lines += 1
      dest.close if 0 == lines % line_size
    rescue
      dest.close if !dest.nil?
    end
  end
}
puts lines
