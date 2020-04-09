.PHONY: all

all:

VERBOSE := -vv

submodule:
	git submodule update --init --recursive

%.deploy: tasks/all.yml #group_vars/%.yml 
	client/ansible-playbook $(VERBOSE) -K -l $(basename $@) "$<"
%.check: tasks/all.yml #group_vars/%.yml
	client/ansible-playbook --check $(VERBOSE) -K -l $(basename $@) "$<"

