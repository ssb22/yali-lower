These syllables were recorded in context by
Cheng Ya Li for the Gradint program in June
2008.  Sound editing was done by Cameron Wong
(developer of the Ekho speech synthesizer) and
Silas S. Brown, using Audacity and Praat.

(The yali-low version has been voice-changed to reduce the pitch.)

You can redistribute and/or modify these recordings under the terms of
the GNU General Public License as published by the Free Software
Foundation; either version 3 of the License, or (at your option) any
later version.

These recordings are distributed in the hope that they will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

If you are running GNU/Linux on a solid-state device (OLPC XO, NSLU2, etc),
you probably don't want Gradint to have to concatenate these files to make a
custom WAV for each phrase.  Linux is usually good enough for Gradint not to
have to do this, in which case you can convert them back to WAV by doing:

for N in zh/yali-low/*.raw ; do sox -t raw -r 44100 -s -2 $N $(echo $N|sed -e s/raw$/wav/) && rm $N; done && rm header.wav
