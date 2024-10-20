# Define the directories and files to be cleaned
DIRS_TO_CLEAN := _site
FILES_TO_CLEAN := file1.txt file2.log

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
    @echo "Cleaning files: $(FILES_TO_CLEAN)"
    @for file in $(FILES_TO_CLEAN); do \
        if [ -f "$$file" ]; then \
        rm -f "$$file"; \
        fi; \
    done