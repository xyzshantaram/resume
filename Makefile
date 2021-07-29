PDF = SiddharthSingh_resume.pdf

default: build

clean:
	rm -f resume.cyblog
	rm -f index.html
	rm -f $(PDF)

build: clean
	cat 'cyblog-meta' > 'resume.cyblog'
	cat 'README.md'>> 'resume.cyblog'
	cyblog resume.cyblog --force -o index.html
	wkhtmltopdf --print-media-type --disable-smart-shrinking index.html $(PDF)