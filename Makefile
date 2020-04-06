DIRS := $(shell find -maxdepth 2 -name '.chalice' -printf '%h\n')

check-tf-fars:
ifndef AWS_PROFILE
	$(error "AWS_PROFILE required")
endif

init: $(DIRS)
	@echo "Update Makefile..."
	@for d in $^; do cp Makefile.sub $$d/Makefile ; done

deps: $(DIR)
	@for d in $^; do pip install -r $$d/requirements.txt ; done

package: $(DIRS)
	$(MAKE) init
	$(MAKE) deps
	@echo "Package..."
	@for d in $(DIRS); do $(MAKE) -C $$d package ; done

tf-modules: $(DIRS)
	bin/generate-tf-modules $^

plan: check-tf-fars package tf-modules
	$(MAKE) -C infra plan
