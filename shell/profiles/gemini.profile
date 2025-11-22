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

  open https://gemini.google.com/app
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
    echo -n "What is the difference between the two items listed below?\n- ${1}\n- ${2}" | pbcopy
  else
    echo -n "What is the difference among the three items listed below?\n- ${1}\n- ${2}\n- ${3}" | pbcopy
  fi

  open https://gemini.google.com/app
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
    echo -n "Which sounds more natural?\n- ${1}\n- ${2}" | pbcopy
  else
    echo -n "Which sounds more natural?\n- ${1}\n- ${2}\n- ${3}?" | pbcopy
  fi

  open https://gemini.google.com/app
}

#
# The writing editor gem
#

# Stands for "Fill in the blank."
fb() {
  echo -n "Fill in the blank below.\n\"$(pbpaste)\"" | pbcopy

  open https://gemini.google.com/gem/writing-editor
}

# Stands for Writing Editor.
we() {
  echo -n "Proofread and refine the sentence(s) or phrase(s) below.\n\n\"$(pbpaste)\"\n\nIs it grammatically correct?\nDoes it sound natural?" | pbcopy

  open https://gemini.google.com/gem/writing-editor
}
