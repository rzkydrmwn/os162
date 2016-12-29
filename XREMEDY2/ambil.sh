# (c) 2016 M. Rizky Darmawan -- This is free software
# Feel free to copy and/or modify and/or distribute it,
# provided this notice, and the copyright notice, are preserved.
# REV01 Thu Dec 29 22:20:18 WIB 2016
# START Thu Dec 29 09:20:34 WIB 2016
# Script menyimpan webpage dalam format text,
# mengambil line yang mengandung [RK-**] dimana * adalah digit 0-9, 
# dan menghapus line yang mengandung [DISK].
 
page="$(w3m -dump -cols 120 http://os162.vlsm.org/2016/11/ranking-os162.html)" 
start="================================================== START BERKAS" 
stop="================================================== STOP BERKAS" 

echo "$start" > ranking.txt
echo "$page" > tmp 
grep -w 'RK-[0-9][0-9]' tmp > tmp1
grep -v DISK tmp1 > tmp2 
sed 's/\[//g;s/\]//g' tmp2 >> ranking.txt
echo "$stop" >> ranking.txt
rm tmp
rm tmp1
rm tmp2


