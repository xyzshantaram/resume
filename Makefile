PDF = SiddharthSingh_resume.pdf

default: dist

clean:
	rm -f resume.cyblog
	rm -f index.html
	rm -f $(PDF)

dist: clean
	cp 'cyblog-meta' 'resume.cyblog'
	cat 'README.md' >> 'resume.cyblog'
	cyblog resume.cyblog --force -o index.html
	# Needs wkhtmltopdf v0.12
	wkhtmltopdf --print-media-type --disable-smart-shrinking index.html $(PDF)

preview: dist
	evince $(PDF)