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
�>��cWorld课程表.sh �W[o�V~篘���	`Q��$��nj�		��E4E!S��F$U�J����\�n}I��Xr6Nkɲe �M��ڪI=e�I��$�������3g��̙��q3ȋ̠72D�hSZa������d�(-��V9+�P���ʼ$B0*;�� "{�2����9��D�%��+C>�p!�x.�rݮ�CA\�]��T(̋��^u{<,	r\z(>O3Y
{�	ѠW�|���( ��x?|�A��V�K��}�'R�5��Eq�4�'�=ud��-��p5��3�yH�4���`��gϞ�畽LPb�A�\�Y|NS�<8�r���ܶ��7ޔ�.L�3ߠnz�~U���S5���x�	�fV1}b�$gՅ�:�T�.j��ۻ$qX����63^Y\)�&��I>5-���ڊ4�l��`��f���Rl^�����o�5�Y?N�+�+cǩ{G��G�ʑ��0��"�)�#e���>V ���ԝ*�Zʘ����T����*���/Ŧ����e�G�Mx9�r�`Z��U����0��?��չur8��"�"_��x�t���'���d|V��P�rZvNݙ�Ede��)$�E��*����%����T݆�Sl4�	��u��&�!Y�2��>�,�����~�q��x溇��A�	p2��r�0m��>p�}�i����O<m�����#|@</\���/���\�����G�/���0�]���w\����Im�O�<�n����ay�NEE�����s����7�G�]Ua1Յ-��R��$;��h��ђ���j�ۊ�]�FĐ�(��]!1 o�	���e�q(�,�wP�lP$�EU~�"�Jb��O�����G�~����[���7b"��&�����i��w�gE=��p�-��#��p��m��,�2���A�iz*�8���sR'tp5�<���) X���B+�r/��Ϫ?������,�k�ܴez�8mBt"�,E�!L����}/pv��T��q��3���̆6�L���`�t����#ׄ��"�^C?����>@;B����=*�٧֙g�� �����1k�5Z�ܓqLOyoJO.�g�N�j򝼦=�6�źe�%I�Ѕn}��ࣧhx�<�nc���q-~�`�F�T�\X�\��OP�UM���zj�Ty���~�e�4�䤪����'=[$ký���㡰����__��]�a��j��E��^�����tk��排|�D/��d��6:O2���2Y�|=5�PW6���m���`7.}{�r�@}�RF4{�e��֊~8Q>8Ԧӎ��7��a����~��r�[���~ͤO�ۃu �ݴ����L��^�әV�4��u��l<zjm��͓�I�s	u6P�G+�Y�y+��J*O��-�ճk�4gngZ��LC�'��j.��∽H���O69�@�X�yź��EE�~�F5�CMUrd;o'�:�Υ�;Ѻ��h{�Zq��D�{��F8h���m�E6:O����Q]&��@yLʃT�Iu#u���n�\����������y�Y�oҿV?����:����C|)�?b1���G�I��Z-�JsI|?_�i���MT
�@��/˷�zs
. u^4�ex����.�c��G�}I7�� ��+�  