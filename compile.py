# compile everything into the index.html file
# for max efficiency, compile right into the clipboard for pasting into tumblr:
# python compile.py && cat compiled/index.html | pbcopy

import os
import pystache

def read_file(filename):
	with open(filename, 'r') as f:
		content = f.read();
	return content

def write_file(filename, content):
	with open(filename, 'w') as f:
		f.write(content)

class Index(object):
	def css(self):
		return read_file("css/styles.css")

def main():
	os.system("lessc -x css/styles.less css/styles.css")
	template_instance = Index()
	renderer = pystache.Renderer(search_dirs="template")
	content = renderer.render(template_instance)
	write_file("compiled/index.html", content)
	print "done"

if __name__ == '__main__':
	main()