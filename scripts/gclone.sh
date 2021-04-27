cat repos.txt | while read LINE
do
  git clone https://github.com/HE-Arc/$LINE.git
  git clone https://github.com/HE-Arc/$LINE.wiki.git
done

# git@github.com:HE-Arc/comptarcilite.git
# https://github.com/HE-Arc/comptarcilite.git
