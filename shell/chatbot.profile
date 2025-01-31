ai() {
  local keyword=$(pbpaste)

  urls=(
    "https://claude.ai/new?q=$keyword"
    "https://www.perplexity.ai/?q=$keyword"
  )

  for url in "${urls[@]}"
  do
    open -a 'Google Chrome' $url
  done
}

explf() {
  echo "Explain the Flutter code if you can.\n\`\`\`\n$(pbpaste)\n\`\`\`\n" | pbcopy
  ai
}

optmf() {
  echo "Optimize the Flutter code if you can.\n\`\`\`\n$(pbpaste)\n\`\`\`\n" | pbcopy
  ai
}

smplf() {
  echo "Simplify the Flutter code if you can.\n\`\`\`\n$(pbpaste)\n\`\`\`\n" | pbcopy
  ai
}

hdi() {
  echo "How do I $(pbpaste) ?" | pbcopy
  ai
}

sf() {
  echo "What does $(pbpaste) stand for?" | pbcopy
  ai
}

tds() {
  echo "以下の文章は正しいか。「$(pbpaste)」" | pbcopy
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
