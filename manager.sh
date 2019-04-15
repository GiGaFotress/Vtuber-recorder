echo "Please in put name you want end record:"
read  NAME
echo "List of running recorder"
echo "$(grep $NAME running.txt)"
PID1=$(grep $NAME running.txt|awk '{print $2}'|sed -n '1p')
PID2=$(grep $NAME running.txt|awk '{print $2}'|sed -n '2p')
PID3=$(grep $NAME running.txt|awk '{print $2}'|sed -n '3p')
PID4=$(grep $NAME running.txt|awk '{print $2}'|sed -n '4p')
echo "Which one you want to kill?"
echo "Input number "
read PID
echo " "
case $PID in
1)
[[ -n "$PID1" ]] && kill -s 9 $PID1;
CLEANPID1=$(grep $PID1 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID1/"d running.txt;;
2)
[[ -n "$PID2" ]] && kill -s 9 $PID2;
CLEANPID2=$(grep $PID2 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID2/"d running.txt;;
3)
[[ -n "$PID3" ]] && kill -s 9 $PID3;
CLEANPID3=$(grep $PID3 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID3/"d running.txt;;
4)
[[ -n "$PID4" ]] && kill -s 9 $PID4;
CLEANPID4=$(grep $PID4 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID4/"d running.txt;;
12)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID2" ]] && kill -s 9 $PID2;
CLEANPID1=$(grep $PID1 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID1/"d running.txt;
CLEANPID2=$(grep $PID2 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID2/"d running.txt;;
13)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID3" ]] && kill -s 9 $PID3;
CLEANPID1=$(grep $PID1 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID1/"d running.txt;
CLEANPID3=$(grep $PID3 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID3/"d running.txt;;
14)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID4" ]] && kill -s 9 $PID4;
CLEANPID1=$(grep $PID1 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID1/"d running.txt;
CLEANPID4=$(grep $PID4 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID4/"d running.txt;;
23)
[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID3" ]] && kill -s 9 $PID3;
CLEANPID2=$(grep $PID2 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID2/"d running.txt;
CLEANPID3=$(grep $PID3 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID3/"d running.txt;;
24)
[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID4" ]] && kill -s 9 $PID4;
CLEANPID2=$(grep $PID2 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID2/"d running.txt;
CLEANPID4=$(grep $PID4 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID4/"d running.txt;;
34)
[[ -n "$PID3" ]] && kill -s 9 $PID3;[[ -n "$PID4" ]] && kill -s 9 $PID4;
CLEANPID3=$(grep $PID3 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID3/"d running.txt;
CLEANPID4=$(grep $PID4 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID4/"d running.txt;;
123)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID3" ]] && kill -s 9 $PID3;
CLEANPID1=$(grep $PID1 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID1/"d running.txt;
CLEANPID2=$(grep $PID2 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID2/"d running.txt;
CLEANPID3=$(grep $PID3 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID3/"d running.txt;;
124)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID4" ]] && kill -s 9 $PID4;
CLEANPID1=$(grep $PID1 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID1/"d running.txt;
CLEANPID2=$(grep $PID2 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID2/"d running.txt;
CLEANPID4=$(grep $PID4 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID4/"d running.txt;;
134)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID3" ]] && kill -s 9 $PID3;[[ -n "$PID4" ]] && kill -s 9 $PID4;
CLEANPID1=$(grep $PID1 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID1/"d running.txt;
CLEANPID3=$(grep $PID3 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID3/"d running.txt;
CLEANPID4=$(grep $PID4 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID4/"d running.txt;;
234)
[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID3" ]] && kill -s 9 $PID3;[[ -n "$PID4" ]] && kill -s 9 $PID4;
CLEANPID2=$(grep $PID2 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID2/"d running.txt;
CLEANPID3=$(grep $PID3 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID3/"d running.txt;
CLEANPID4=$(grep $PID4 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID4/"d running.txt;;
1234)
[[ -n "$PID1" ]] && kill -s 9 $PID1;[[ -n "$PID2" ]] && kill -s 9 $PID2;[[ -n "$PID3" ]] && kill -s 9 $PID3;[[ -n "$PID4" ]] && kill -s 9 $PID4;
CLEANPID1=$(grep $PID1 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID1/"d running.txt;
CLEANPID2=$(grep $PID2 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID2/"d running.txt;
CLEANPID3=$(grep $PID3 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID3/"d running.txt;
CLEANPID4=$(grep $PID4 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID4/"d running.txt;;
*) break
;;
#K1=$([[ -n "$PID1" ]] && kill -s 9 $PID1)
#K2=$([[[ -n "$PID2" ]] && kill -s 9 $PID2)
#K3=$([[ -n "$PID3" ]] && kill -s 9 $PID3)
#K4=$([[ -n "$PID4" ]] && kill -s 9 $PID4)
esac


