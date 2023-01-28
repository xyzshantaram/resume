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
	chromium --headless --disable-gpu --no-margins --print-to-pdf=testing.pdf index.html

preview: dist
	evince $(PDF)