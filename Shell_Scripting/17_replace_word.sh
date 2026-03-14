# Fins a word in a file and replaces it with another word

sed -i 's/old_word/new_word/g' filename.txt

# Explanation:
# -i: Edit the file in place (make changes directly to the file)
# s: Substitute command
# old_word: The word you want to replace
# new_word: The word you want to use as a replacement
# g: Global flag to replace all occurrences of the old word in the file

# print replaces output without modifying file
sed 's/old_word/new_word/g' filename.txt

# replace text in multiple files
sed -i 's/old_word/new_word/g' *.txt

# replace text in a specific line number
sed -i '3s/old_word/new_word/' filename.txt

