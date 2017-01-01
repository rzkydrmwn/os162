#!/bin/bash
# (c) 2016 M. Rizky Darmawan -- This is free software
# Feel free to copy and/or modify and/or distribute it,
# provided this notice, and the copyright notice, are preserved.
# REV01 Sun  1 11:55:22 WIB 2017
# START Sat 31 17:22:10 WIB 2016
# Script menyimpan array name & url, melakukan pengecekan apakah
# name dapat di dump, bila gagal akan dibuat file kosong RK-XX-GAGAL.txt
# bila berhasil, hasil dump akan diisikan ke dalam RK-XX.txt

tmp="$(grep -o 'RK-[0-9][0-9]' ranking.txt)"
name=()
for val in $tmp; do
	name+=("$val")
done
tmp2="$(grep -o 'http[^ ]*' ranking.txt)"
url=()
for val2 in $tmp2; do 
	url+=("$val2")
done

for ((i=0; i<${#name[@]}; i++)); do
	successPage="$(w3m -dump ${url[i]})"
	if [ -z "$successpage" ]; then
		touch "${name[i]}-GAGAL.txt"
	else
	failedPage = "$(w3m -dump -cols 120 ${url[i]})"
	echo "$failedPage" > "${name[i]}.txt"
	fi
done

