PAGES = index research publications packages
HTML  = $(addsuffix .html,$(PAGES))

# Changes whenever site.css changes, so browsers fetch the new stylesheet
CSSVERSION := $(shell shasum assets/site.css | cut -c1-10)

all: compile

compile: $(HTML)

%.html: %.md templates/site.html assets/site.css
	pandoc $< -s --wrap=none --template templates/site.html -V cssversion=$(CSSVERSION) -t html5 -o $@

clean:
	rm -f $(HTML)

.PHONY: all compile clean
