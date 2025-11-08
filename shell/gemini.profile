#
# Prompt library for the Gemini gem "Writing editor"

# Stands for Writing Editor.
we() {
  echo -n "Review the sentence(s) or phrase(s) below. Is it grammatically correct? Does it sound natural? Can you refine it?\n\n\"$(pbpaste)\"" | pbcopy
  open https://gemini.google.com/gem/writing-editor
}


#
# Prompt library for the Gemini custom gem for a legal examination
#

# Stands for 5 years old.
5() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <keyword1> [keyword2]"
    return
  fi

  if [[ $# -lt 2 ]]
  then
    echo "${1}を5歳児に説明してください。" | pbcopy
  else
    echo "${1}における${2}を5歳児に説明してください。" | pbcopy
  fi

  open https://gemini.google.com/gem/c43c5873bd3f
}

# Stands for 代表例 (daihyorei)
dhr() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <keyword1> [keyword2]"
    return
  fi

  if [[ $# -lt 2 ]]
  then
    echo "${1}の代表例を教えてください。" | pbcopy
  else
    echo "${1}における${2}の代表例を教えてください。" | pbcopy
  fi

  open https://gemini.google.com/gem/c43c5873bd3f
}

# Stands for 教えて (oshiete)
os() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <keyword1> [keyword2]"
    return
  fi

  if [[ $# -lt 2 ]]
  then
    echo "${1}について教えてください。" | pbcopy
  else
    echo "${1}における${2}について教えてください。" | pbcopy
  fi

  open https://gemini.google.com/gem/c43c5873bd3f
}

# Stands for 正しい (tadashii)
td() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <keyword>"
    return
  fi

  echo "「${1}」という記述は正しいですか？根拠条文または根拠判例など法的根拠も教えてください。" | pbcopy
  open https://gemini.google.com/gem/c43c5873bd3f
}
#
# Miscellaneous functions that take more than one parameter.
#

# Stands for 違い (chigai).
cgi() {
  if [[ $# -lt 2 ]]
  then
    echo "Usage: $0 <keyword1> <keyword2> [keyword3]"
    return
  fi

  if [[ $# -lt 3 ]]
  then
    open "https://www.google.com/search?hl=en&udm=50&q=${1}と${2}の違いを教えてください。"
  else
    open "https://www.google.com/search?hl=en&udm=50&q=${1}と${2}と${3}との違いを教えてください。"
  fi
}

# Stands for "What is the difference?"
witd() {
  if [[ $# -lt 2 ]]
  then
    echo "Usage: $0 <keyword1> <keyword2> [keyword3]"
    return
  fi

  if [[ $# -lt 3 ]]
  then
    open "https://www.google.com/search?hl=en&udm=50&q=What is the difference between ${1} and ${2}?"
  else
    open "https://www.google.com/search?hl=en&udm=50&q=What is the difference among ${1}, ${2}, and ${3}?"
  fi
}

# Stands for "Which sounds more/most natural?"
wsmn() {
  if [[ $# -lt 2 ]]
  then
    echo "Usage: $0 <keyword1> <keyword2> [keyword3]"
    return
  fi

  if [[ $# -lt 3 ]]
  then
    open "https://www.google.com/search?hl=en&udm=50&q=Which sounds more natural: ${1} or ${2}?"
  else
    open "https://www.google.com/search?hl=en&udm=50&q=Which sounds most natural: ${1}, ${2}, or ${3}?"
  fi
}
