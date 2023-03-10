
we() {
  vim $(which "$@")
}
complete -c we

# ldf -- last downloaded file
ldf() {
  local file=~/Downloads/$(ls -1t ~/Downloads/ | head -n1)
  read -p "confirm: $file "
  mv "$file" .
}

wb() {
  vim "workbook.$1"
}

check_expiration() {
  echo | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -noout -dates
}

bs() {
  browser-sync start --server --files "$@"
}

