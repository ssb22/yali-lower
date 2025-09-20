---
# Metadata for HuggingFace dataset viewer （请垂直下移看汉语解释）
# (Humans please skip past this.  Why does HuggingFace insist it comes first?...)
license: gpl-3.0
task_categories:
- text-to-speech
- automatic-speech-recognition
language:
- zh
modality:
- audio
size_categories:
- 1K<n<10K
tags:
- mandarin
- syllables
- tones
- speech-synthesis
- phonetics
- native-speaker
---

# Yali-Lower: Isolated Mandarin Syllables with Full Tone Coverage (lower-pitch version)
## Yali语音：带完整声调的孤立汉语音节录音库

These syllables were recorded in context by
Cheng Ya Li for the [Gradint](../gradint) program
in June 2008.  Sound editing was done by Cameron Wong
(developer of the [Ekho](https://github.com/hgneng/ekho)
speech synthesizer) and Silas S. Brown, using
Audacity and Praat.

这些音节由程雅丽（Cheng Ya Li，汉字待确认）于2008年6月为
[Gradint](../gradint)程序录制。音频编辑由黄冠能（Cameron
Wong，[Ekho](https://github.com/hgneng/ekho)语音合成器的开
发者）和Silas S. Brown（赛乐思）使用Audacity和Praat完成。

## Technical Notes
- **Tone 1 and Tone 6**: Slightly pitch-adjusted to
  compensate for pitch drift across recording session,
  ensuring consistent tone perception when syllables are
  synthesized together
- **Tones 2, 3, 4, 5**: Original pitch preserved from
  context extraction
- **Tone 3**: Recordings represent the "half tone 3"
  commonly used in natural speech
- **Tone 6**: Higher-pitched neutral tone variant
  typically used after Tone 3

技术说明
- **第一声和第六声**：已进行轻微音调调整以补偿录音时段间的音调漂移
- **第二、三、四、五声**：保留从语境中提取的原始音调
- **第三声**：录音为自然语音中常用的"半三声"
- **第六声**：通常在第三声后使用的高音中性调

## Compiling for Gradint

`yali-lower.exe` is a zip file that must be
compatible with unzip on non-Windows platforms
as well as being self-extracting.

`unzipsfx.exe` is a Win32 build of `unzipsfx`
(cross-compiled with Mingw32) with
`CHEAP_SFX_AUTORUN` defined, and hacked
`process.c` so it doesn't confirm the Auto-run
command.

Use `make` to make a new `yali-lower.exe` from the WAVs.

Gradint is at http://ssb22.user.srcf.net/gradint
and is also mirrored at http://ssb22.gitlab.io/gradint just in case.

## License
You can redistribute and/or modify these recordings under the terms of
the GNU General Public License as published by the Free Software
Foundation; either version 3 of the License, or (at your option) any
later version.

These recordings are distributed in the hope that they will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

您可以根据自由软件基金会发布的 GNU 通用公共许可证（GPL）条款重新分发和/或修改这些录音；许可证版本为第 3 版或任何更新版本。 

这些录音以“按原样”方式提供，不提供任何形式的担保，包括但不
限于适销性或特定用途适用性的默示担保。
