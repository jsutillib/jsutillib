SUBDIRS:=common selection globals

FILES_JS:=$(foreach S, $(SUBDIRS), $(addprefix $(S)/, jsutillib-$(S).min.js))
FILES_CSS:=$(foreach S, $(SUBDIRS), $(addprefix $(S)/, jsutillib-$(S).min.css))

all: $(SUBDIRS) 
ifneq ("",$(FILES_JS)")
	cat $(FILES_JS) 2>&- > jsutillib.min.js || true
endif
ifneq ("","$(FILES_CSS)")
	cat $(FILES_CSS) 2>&- > jsutillib.min.css || true
endif

$(SUBDIRS):
	@echo "Building $(@F)"
	@make -C $@

.PHONY: all $(SUBDIRS) $(SUBDIRSCLEAN)

clean: 
ifneq ("","$(wildcard $(FILES_JS))")
	rm -f $(wildcard $(FILES_JS))
endif
ifneq ("","$(wildcard $(FILES_CSS))")
	rm -f $(wildcard $(FILES_CSS))
endif
	rm -f jsutillib.min.js jsutillib.min.css
	@for S in $(SUBDIRS); do make -C $$S clean; done
