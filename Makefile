all: update

update:
	make clean
	make fonts

fonts: ttc
	mkdir -p $@
	find ttc -name '*.ttc' -exec ./ttc2ttf {} $@ \;
	touch $@
	
ttc:
	mkdir -p $@
	cd $@ && wget http://downloads.sourceforge.net/project/wqy/wqy-microhei/0.2.0-beta/wqy-microhei-0.2.0-beta.tar.gz -O - | tar xzf -

	cd $@ && wget http://downloads.sourceforge.net/project/wqy/wqy-zenhei/0.9.45%20%28Fighting-state%20RC1%29/wqy-zenhei-0.9.45.tar.gz -O - | tar xzf -
	
	touch $@

clean: ttc fonts
	rm -Rf $^

.PHONY: clean update