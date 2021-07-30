PDF = SiddharthSingh_resume.pdf

default: dist

clean:
	rm -f resume.cyblog
	rm -f index.html
	rm -f $(PDF)

dist: clean
	cat 'cyblog-meta' > 'resume.cyblog'
	cat 'README.md'>> 'resume.cyblog'
	cyblog resume.cyblog --force -o index.html
	wkhtmltopdf --print-media-type --disable-smart-shrinking index.html $(PDF)

preview: dist
	evince $(PDF)