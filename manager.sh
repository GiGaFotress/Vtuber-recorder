echo "Please in put you want end record:"
read  name 
echo "grep $name running.txt"
echo "Are you sure?"


grep $name running.txt||sed -n '1p'
