# sh is nasty.

ok() {
   exec 3>&1
   eval `
      exec 4>&1 >&3 3>&- 
      {
          eval "$@" 2>&1 >/dev/null
          echo "EC=$?;" >&4
      } | sed 's/^/# /'
      `
   [ "$EC" = 0 ] && echo "ok - $@" || echo "not ok - $@: $EC"
   return $EC
}
