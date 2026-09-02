# Build every resume with Typst, giving each PDF the name it carries when it is
# sent to an employer. Nothing here is committed: out/ is ignored, and the PDFs
# reach people through a GitHub release instead.

TYPST ?= typst
DENO  ?= deno
OUT   := out

# Source stem : the name the built PDF carries.
NAMES := \
	01-nostr-bitcoin:Siddharth-Singh-Nostr-Bitcoin-Engineer \
	02-ai-harness:Siddharth-Singh-AI-Agent-Engineer \
	03-rust-systems:Siddharth-Singh-Rust-Systems-Engineer \
	04-fullstack-ts:Siddharth-Singh-Fullstack-Engineer \
	05-hardware-mech:Siddharth-Singh-Mechanical-Engineer \
	06-general:Siddharth-Singh-Resume

.PHONY: all html site clean tag

all:
	@mkdir -p $(OUT)
	@for pair in $(NAMES); do \
		src="$${pair%%:*}"; dst="$${pair##*:}"; \
		echo "  $$src.typ -> $(OUT)/$$dst.pdf"; \
		$(TYPST) compile --features html "$$src.typ" "$(OUT)/$$dst.pdf" || exit 1; \
	done

# One readable HTML page per resume, for GitHub Pages. HTML export is incomplete
# in typst and prints a warning; the warning is expected.
html:
	@mkdir -p $(OUT)/site
	@for pair in $(NAMES); do \
		src="$${pair%%:*}"; dst="$${pair##*:}"; \
		echo "  $$src.typ -> $(OUT)/site/$$dst.html"; \
		$(TYPST) compile --features html --format html "$$src.typ" "$(OUT)/site/$$dst.html" || exit 1; \
	done

# What GitHub Pages serves: the README as the index, the general resume beside
# it so it opens in the browser, and the rest for anyone who wants them.
site: all html
	@mkdir -p $(OUT)/site
	$(DENO) run --allow-read --allow-write build-index.ts $(OUT)/site/index.html
	cp $(OUT)/*.pdf $(OUT)/site/
	cp $(OUT)/Siddharth-Singh-Resume.pdf $(OUT)/site/resume.pdf
	cp $(OUT)/site/Siddharth-Singh-Resume.html $(OUT)/site/resume.html

clean:
	rm -rf $(OUT)

# Release tags are ISO 8601 basic with the local UTC offset, e.g.
# 20260903T001948+0530. Colons are not legal in a git ref, so the basic form is
# the one that survives.
tag:
	@t="$$(date +%Y%m%dT%H%M%S%z)"; \
	git tag "$$t" && echo "tagged $$t; push it with: git push origin --tags"
