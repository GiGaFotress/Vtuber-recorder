echo "Please in put you want end record:"
read  NAME
echo "$(grep $NAME running.txt)"
PID1=$(grep $NAME running.txt|awk '{print $2}'|sed -n '1p')
PID2=$(grep $NAME running.txt|awk '{print $2}'|sed -n '2p')
PID3=$(grep $NAME running.txt|awk '{print $2}'|sed -n '3p')
PID4=$(grep $NAME running.txt|awk '{print $2}'|sed -n '4p')
echo "Which one you want to kill?"
read PID
case $PID in
1)
[[ -n "$PID1" ]] && kill -s 9 $PID1;;
2)
[[ -n "$PID2" ]] && kill -s 9 $PID2;;
3)
[[ -n "$PID3" ]] && kill -s 9 $PID3;;
4)
[[ -n "$PID4" ]] && kill -s 9 $PID4;;
12)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID2" ]] && kill -s 9 $PID2;;
13)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID3" ]] && kill -s 9 $PID3;;
14)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID4" ]] && kill -s 9 $PID4;;
23)
[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID3" ]] && kill -s 9 $PID3;;
24)
[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID4" ]] && kill -s 9 $PID4;;
34)
[[ -n "$PID3" ]] && kill -s 9 $PID3;[[ -n "$PID4" ]] && kill -s 9 $PID4;;
123)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID3" ]] && kill -s 9 $PID3;;
124)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID4" ]] && kill -s 9 $PID4;;
134)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID3" ]] && kill -s 9 $PID3;[[ -n "$PID4" ]] && kill -s 9 $PID4;;
234)
[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID3" ]] && kill -s 9 $PID3;[[ -n "$PID4" ]] && kill -s 9 $PID4;;
1234)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID3" ]] && kill -s 9 $PID3;[[ -n "$PID4" ]] && kill -s 9 $PID4;;
*) break
;;
#K1=$([[ -n "$PID1" ]] && kill -s 9 $PID1)
#K2=$([[[ -n "$PID2" ]] && kill -s 9 $PID2)
#K3=$([[ -n "$PID3" ]] && kill -s 9 $PID3)
#K4=$([[ -n "$PID4" ]] && kill -s 9 $PID4)
esac


