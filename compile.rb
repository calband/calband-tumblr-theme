# compile everything into the index.html file

`lessc -x styles.less styles.css`
cmd = "sed 's/!__COMPILE_CSS/" + `cat styles.css`.strip + "/g' index.html.tumblr > index.html"
exec(cmd)
