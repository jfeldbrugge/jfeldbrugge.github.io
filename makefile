PAGES = index research publications packages
HTML  = $(addsuffix .html,$(PAGES))

all: compile

compile: $(HTML)

%.html: %.md templates/site.html
	pandoc $< -s --wrap=none --template templates/site.html -t html5 -o $@

clean:
	rm -f $(HTML)

.PHONY: all compile clean
