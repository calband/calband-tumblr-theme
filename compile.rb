# compile everything into the index.html file
# for max efficiency, compile right into the clipboard for pasting into tumblr:
# ruby compile.rb && cat index.html | pbcopy

`lessc -x styles.less styles.css`
styles = `cat styles.css`.strip
styles = styles.gsub(/"/, "'")
styles = styles.gsub(/\\/, "\\") # "\" => "\\"
styles = styles.gsub("/", '\\/') # "/" => "\/"
styles = styles.gsub(/\&/, "\&") # "\" => "\\"
styles = styles.gsub("\n", "") # "\" => "\\"
cmd = "sed \"s/{!__COMPILE_CSS}/" + styles + "/g\" index.template.html > index.html"
system(cmd)
puts "done."
