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
