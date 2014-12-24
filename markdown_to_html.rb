# USAGE
# ``` cat test_markdown.md | ruby md_to_html.rb > test_markdown.html ```

require "kramdown"
p Kramdown::Document.new(STDIN.read).to_html
