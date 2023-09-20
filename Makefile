# Define the directories to be cleaned
DIRS_TO_CLEAN := _site

# Define the clean target

serve:
	@bundle exec jekyll serve --force_polling

clean:
	@echo "Cleaning directories: $(DIRS_TO_CLEAN)"
	@for dir in $(DIRS_TO_CLEAN); do \
		if [ -d "$$dir" ]; then \
		rm -rf "$$dir"; \
		fi; \
	done