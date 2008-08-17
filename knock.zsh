ok() {
   eval "$@" 2>&1 >/dev/null | sed 's/^/# /'
   EC=$pipestatus[1]
   [[ $EC = 0 ]] && echo "ok - $@" || echo "not ok - $@: $EC"
   return $EC
}
