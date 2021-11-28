SUBDIRS:=common selection globals

FILES_JS:=$(foreach S, $(SUBDIRS), $(addprefix $(S)/, $(S).js))
FILES_CSS:=$(foreach S, $(SUBDIRS), $(addprefix $(S)/, $(S).css))
FILES_JS_MIN:=$(foreach S, $(SUBDIRS), $(addprefix $(S)/, $(S).min.js))
FILES_CSS_MIN:=$(foreach S, $(SUBDIRS), $(addprefix $(S)/, $(S).min.css))

all: $(SUBDIRS) 
ifneq ("",$(FILES_JS)")
	uglifyjs $(FILES_JS) version.js -b $(UGLIFY_VARS) | cat notice - > jsutillib.js
	uglifyjs $(FILES_JS_MIN) version.js $(UGLIFY_VARS_MIN) | cat notice.min - > jsutillib.min.js
endif
ifneq ("","$(FILES_CSS)")
	cleancss $(wildcard $(FILES_CSS)) --format beautify | cat notice - > jsutillib.css
	cleancss $(wildcard $(FILES_CSS)) | cat notice.min - > jsutillib.min.css
endif

$(SUBDIRS):
	@echo "Building $(@F)"
	@make -C $@

.PHONY: all $(SUBDIRS) $(SUBDIRSCLEAN)

clean: 
# ifneq ("","$(wildcard $(FILES_JS))")
# 	rm -f $(wildcard $(FILES_JS))
# endif
# ifneq ("","$(wildcard $(FILES_JS_MIN))")
# 	rm -f $(wildcard $(FILES_JS_MIN))
# endif
# ifneq ("","$(wildcard $(FILES_CSS))")
# 	rm -f $(wildcard $(FILES_CSS))
# endif
# ifneq ("","$(wildcard $(FILES_CSS_MIN))")
# 	rm -f $(wildcard $(FILES_CSS_MIN))
# endif
	rm -f jsutillib.min.js jsutillib.min.css jsutillib.js jsutillib.css
	@for S in $(SUBDIRS); do make -C $$S clean; done
