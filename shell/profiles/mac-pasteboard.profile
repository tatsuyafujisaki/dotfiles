#
# Prompts that take one parameter for a special Gemini gem
#

# stands for 教えて (oshiete)
alias os='echo -n "$(pbpaste)について教えてください。" | pbcopy'

#
# Prompts that take more than one parameter
#

# stands for 違い (chigai).
cgi() {
  if [[ $# -lt 2 ]]
  then
    echo "Usage: $0 <keyword1> <keyword2> [keyword3]"
    return
  fi

  if [[ $# -lt 3 ]]
  then
    echo -n "以下の違いを教えてください。\n- ${1}\n- ${2}" | pbcopy
  else
    echo -n "以下の違いを教えてください。\n- ${1}\n- ${2}\n- ${3}" | pbcopy
  fi
}

# stands for 一般的 (ippanteki).
ip() {
  if [[ $# -lt 2 ]]
  then
    echo "Usage: $0 <keyword1> <keyword2> [keyword3]"
    return
  fi

  if [[ $# -lt 3 ]]
  then
    echo -n "以下のどちらの表現がより一般的ですか。\n- ${1}\n- ${2}" | pbcopy
  else
    echo -n "以下のどの表現が最も一般的ですか。\n- ${1}\n- ${2}\n- ${3}" | pbcopy
  fi
}
# stands for "What is the difference?"
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
}

# stands for "Which sounds more/most natural?"
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
}

#
# Prompts for coding
#

alias gol='echo -n "Describe the program written in the Go programming language below.\n\n\`\`\`$(pbpaste)\n\`\`\`" | pbcopy'

#
# Prompts for language learning
#

# stands for "Fill in the blank."
alias fb='echo -n "Fill in the blank below.\n\"$(pbpaste)\"" | pbcopy'

# stands for Writing Editor.
alias sn='echo -n "Proofread and refine \"$(pbpaste)\"\nDoes it sound natural?" | pbcopy'
