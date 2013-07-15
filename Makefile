default: build

PRODUCT_LIST=$(addsuffix .html, $(basename $(wildcard *.md)))

help:
	@echo "Options"
	@echo
	@echo " list	Lists products"
	@echo

list:
	@echo $(PRODUCT_LIST)

build: $(PRODUCT_LIST)

clean:
	rm -vf *~ $(PRODUCT_LIST)

%.html: %.md markdown.css Makefile
	echo "<style>" > $@
	cat markdown.css >> $@
	echo "</style>" >> $@
#	perl -pe '1 while s/\t/" "x(8-($-[0]%8))/e' < $*.md | perl ./Markdown.pl >> $@
	perl ./Markdown.pl < $*.md >> $@
