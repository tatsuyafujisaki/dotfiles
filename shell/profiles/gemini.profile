#
# The learning coach gem
#

# Stands for 5 years old.
5() {
  echo -n "$(pbpaste)を5歳児に説明してください。" | pbcopy
  open https://gemini.google.com/gem/learning-coach
}

# Stands for 代表例 (daihyorei)
dhr() {
  echo -n "$(pbpaste)の代表例を教えてください。" | pbcopy
  open https://gemini.google.com/gem/learning-coach
}

gg() {
  echo -n "$(pbpaste)という漢字の語源を教えてください。" | pbcopy
  open https://gemini.google.com/gem/learning-coach
}

# Stands for 教えて (oshiete)
os() {
  echo -n "$(pbpaste)について教えてください。" | pbcopy
  open https://gemini.google.com/gem/learning-coach
}

# Stands for 正しい (tadashii)
td() {
  echo -n "「$(pbcopy)」という記述は正しいですか？根拠条文または根拠判例など法的根拠も教えてください。" | pbcopy
  open https://gemini.google.com/gem/learning-coach
}

# stands for 和製英語 (wasei-eigo)
ws() {
  echo -n "$(pbpaste)は和製英語ですか？" | pbcopy
  open https://gemini.google.com/gem/learning-coach
}


#
# The learning coach gem with prompts that take more than one parameter.
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
    echo -n "${1}と${2}の違いを教えてください。" | pbcopy
  else
    echo -n "${1}と${2}と${3}の違いを教えてください。" | pbcopy
  fi

  open https://gemini.google.com/gem/learning-coach
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
    echo -n "What is the difference between ${1} and ${2}?" | pbcopy
  else
    echo -n "What is the difference among ${1}, ${2}, and ${3}?" | pbcopy
  fi

  open https://gemini.google.com/gem/learning-coach
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
    echo -n "Which sounds more natural: ${1} or ${2}?" | pbcopy
  else
    echo -n "Which sounds more natural: ${1}, ${2} or ${3}?" | pbcopy
  fi

  open https://gemini.google.com/gem/learning-coach
}

#
# The writing editor gem
#

# Stands for "Fill in the blank."
fb() {
  echo -n "Fill in the blank below.\n\n\"$(pbpaste)\"" | pbcopy

  open https://gemini.google.com/gem/writing-editor
}

# Stands for Writing Editor.
we() {
  echo -n "Review the sentence(s) or phrase(s) below. Is it grammatically correct? Does it sound natural? Can you refine it?\n\n\"$(pbpaste)\"" | pbcopy

  open https://gemini.google.com/gem/writing-editor
}
