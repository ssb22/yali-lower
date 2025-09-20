# for older versions of sox:
# RawParams=-r 44100 -c 1 -s -2
# for newer versions:
RawParams=-r 44100 -c 1 -e signed -b 16

yali-lower.exe: wav-syllables setup.bat yali-exe-readme.txt unzipsfx.exe
	mkdir -p partials/zh/yali-low
	cd wav-syllables ; for N in *.wav ; do sox $$N $(RawParams) ../partials/zh/yali-low/$$(echo $$N|sed -e s/wav/raw/); done; cd ..
	cp wav-syllables/\!* partials/zh/yali-low/
	sox -t raw $(RawParams) /dev/null -t wav - 2>/dev/null | cat > partials/header.wav
	cp yali-exe-readme.txt partials/README.txt
	for N in setup.bat partials/README.txt ; do python3 -c "import sys; sys.stdout.buffer.write(sys.stdin.buffer.read().replace(b'\r',b'').replace(b'\n',b'\r\n'))" < $$N > n && mv n $$N; done
	find setup.bat partials -type f | sort | zip -q -9 yali-lower.zip -@
	echo '$$AUTORUN$$>setup.bat' | zip -z yali-lower.zip
	cat unzipsfx.exe yali-lower.zip > yali-lower.exe
	zip -A yali-lower.exe
	rm -rf partials yali-lower.zip

metadata.csv: # for HuggingFace
	echo filename,syllable,tone,tone_description,pitch_adjusted > $@
	for N in wav-syllables/*.wav; do echo $$N,$$(echo $$N|sed -e s,.*/,, -e s/[1-6].*//),$$(echo $$N|sed -e s,[^1-6],,g),$$(case "$$(echo $$N|sed -e s,[^1-6],,g)" in 1) echo high level;; 2) echo rising;; 3) echo low dipping "(half)";; 4) echo falling;; 5) echo neutral;; 6) echo "neutral (high)";; esac),true; done >> $@
