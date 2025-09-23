alias dq='pbpaste | tr -d "\"" | pbcopy && open -a "Google Chrome" https://gemini.google.com/app' # deletes double quotes from the clipboard.

ai() {
  local query=$(pbpaste)
  local urls=(
    "https://chatgpt.com/?q=$query"
    "https://claude.ai/new?q=$query"
    "https://copilot.microsoft.com/?q=$query"
    "https://gemini.google.com/app"
    "https://grok.com/?q=$query"
    "https://www.perplexity.ai/?q=$query"
  )
  open -a 'Google Chrome' "${urls[@]}"
}
