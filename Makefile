PDF = SiddharthSingh_resume.pdf

default: dist

clean:
	rm -f resume.cyblog
	rm -f index.html
	rm -f $(PDF)

html: clean
	cp 'cyblog-meta' 'resume.cyblog'
	cat 'README.md' >> 'resume.cyblog'
	cyblog resume.cyblog --force -o index.html


dist: html
	chromium --headless --disable-gpu --no-margins --no-sandbox --print-to-pdf-no-header --no-pdf-header-footer --print-to-pdf="$(PDF)" index.html

preview: dist
	evince $(PDF)