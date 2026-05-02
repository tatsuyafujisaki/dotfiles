pbpaste | python3 -c 'import sys; print(sys.stdin.read().translate(str.maketrans("0123456789() ", "０１２３４５６７８９（）　")), end="")' | pbcopy
