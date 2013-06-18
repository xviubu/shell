cat my-friends | awk -v RS="" '{ gsub("\n","^Z");print}' | sort -f | awk -v ORS="\n\n"  '{ gsub(".Z","\n");print}' | grep -v '# SORTKEY' 
