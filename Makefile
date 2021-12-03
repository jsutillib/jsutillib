LIBNAME=jsutilslib
SUBDIRS:=common selection activeobject

FILES_JS:=$(foreach S, $(SUBDIRS), $(addprefix $(S)/, $(S).js))
FILES_CSS:=$(foreach S, $(SUBDIRS), $(addprefix $(S)/, $(S).css))
FILES_JS_MIN:=$(foreach S, $(SUBDIRS), $(addprefix $(S)/, $(S).min.js))
FILES_CSS_MIN:=$(foreach S, $(SUBDIRS), $(addprefix $(S)/, $(S).min.css))

all: $(SUBDIRS) 
ifneq ("",$(FILES_JS)")
	uglifyjs init.js $(FILES_JS) -b $(UGLIFY_VARS) | cat notice - > $(LIBNAME).js
	uglifyjs init.js $(FILES_JS_MIN) $(UGLIFY_VARS_MIN) | cat notice.min - > $(LIBNAME).min.js
endif
ifneq ("","$(FILES_CSS)")
	cleancss $(wildcard $(FILES_CSS)) --format beautify | cat notice - > $(LIBNAME).css
	cleancss $(wildcard $(FILES_CSS)) | cat notice.min - > $(LIBNAME).min.css
endif

$(SUBDIRS):
	@echo "Building $(@F)"
	@make -C $@

.PHONY: all $(SUBDIRS) $(SUBDIRSCLEAN)

clean: 
	rm -f $(LIBNAME).min.js $(LIBNAME).min.css $(LIBNAME).js $(LIBNAME).css
	@for S in $(SUBDIRS); do make -C $$S clean; done
