#!/bin/bash

echo '
256 color
font-color: 38;05
bg-color  : 48;05
'

echo 'font-color'
for i in {0..255} ; do
  	printf "\x1b[38;05;${i}m 38;05;${i} "
done

echo
echo

echo 'background-color'
for i in {0..255} ; do
	printf "\x1b[48;05;${i}m 48;05;${i} "
done

echo
