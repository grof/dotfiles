
# bash meta-programming, make it generate some redundant functions
lister() {
  local name=$1
  local command=$2
  local filter=${3:-cat}

  eval "
    ${name}() {
      local SOURCE=\"\$HOME/.lists/${name}\"
      if [ ! -f \"\$SOURCE\" ]; then
        echo \"\$SOURCE does not exist...\"
        return 1
      fi

      FILTER=\"${filter}\" pick_with_vim \"cat \$SOURCE\" \"${command}\" \$1
    }
"
}

lister_num() {
  local name=$1
  for i in $(seq $2); do
    alias ${name}${i}="$name $i"
  done
}

#-------------------------------------------------

lister "g"    "cd"
lister "qc"

lister_num g 12

