ai() {
  local keyword=$(pbpaste)

  urls=(
    "https://claude.ai/new?q=$keyword"
    "https://gemini.google.com"
    "https://www.perplexity.ai/?q=$keyword"
  )

  for url in "${urls[@]}"
  do
    open -a 'Google Chrome' $url
  done
}

fhdi() {
  echo "In Flutter, how do I $(pbpaste)" | pbcopy
  ai
}

fsmpl() {
  echo "Simplify the following Flutter code.\n\`\`\`\n$(pbpaste)\n\`\`\`\n" | pbcopy
  ai
}

gtr() {
  echo "$(pbpaste)の具体例は？" | pbcopy
  ai
}

hdi() {
  echo "How do I $(pbpaste) ?" | pbcopy
  ai
}

grm() {
  echo "Is the following sentence grammatically correct? Does the following sentence sound natural?\n\n$(pbpaste)" | pbcopy
  ai
}

sf() {
  echo "What does $(pbpaste) stand for?" | pbcopy
  ai
}

th() {
  echo "$(pbpaste)とは？" | pbcopy
  ai
}

wdm() {
  echo "What does $(pbpaste) mean?" | pbcopy
  ai
}

wi() {
  echo "What is $(pbpaste) ?" | pbcopy
  ai
}
