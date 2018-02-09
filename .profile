# setting ctrl to caps DOESN'T take when set in .xsession
setxkbmap -layout us -option ctrl:nocaps
export _JAVA_AWT_WM_NONREPARENTING=1
echo "sourcing .profile `date`" >> /home/rk/initlogs.txt
