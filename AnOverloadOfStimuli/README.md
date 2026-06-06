# an overload of stimuli that, as it grows, becomes increasingly difficult to make sense of
### Electronics Patch — For the Mink Duo
**Diego Peralta-Gonzales (b. 2000)**
*May 2026 – Boston, MA*

---

***[Download the patch and necessary files here.](https://drive.google.com/drive/folders/1YmyqcZIq1Y-oMmhM0D6qlCG5m_3nXZ2W?usp=sharing)***

## Overview

This patch controls all electronics for the piece. It is a single SuperCollider file that, once opened and executed, launches a graphical interface from which the operator can run the piece in full. The total duration of the electronics is **8 minutes and 15 seconds**, divided into 10 cues that layer and accumulate over time.

The patch requires no knowledge of SuperCollider to operate. Everything is controlled from the GUI. However, the performers are encouraged to have some sort of familiarity with the software. 

---

## Folder Structure

The patch folder must always maintain this structure. Do not rename or move any files or folders.

```
MinkDuo_PieceElectronics/
├── MinkDuo_PieceElectronics.scd   ← the patch file
└── audio-files/
      ├── gran-buffer.wav            ← audio file for Granulator 1
      ├── gran2-buffer.wav           ← audio file for Granulator 2
      └── first-buffer.wav           ← audio file for the Buffer Playback
```

---

## Before the Performance — Setup

1. Open **SuperCollider**.
2. Open the file `MinkDuo_PieceElectronics.scd`.
3. Make sure the file is **saved** (Cmd+S).
4. Select all the code (Cmd+A) and execute it (Cmd+Return). The GUI window will appear.
5. Press **BOOT SERVER** in the GUI. Wait until the button turns green and reads **SERVER READY**. This loads all sounds and audio files into memory. Do not start the piece before this happens.
6. The audio level meter (s.meter) will open as a separate window next to the GUI. This is normal.

---

## The GUI — Section by Section

### Title Area
Displays the title of the patch and the name of the piece. For reference only.

---

### Chronometer
The large clock display in the center of the GUI. Shows elapsed time in MM:SS format. It starts automatically when the piece begins and is used as a reference to verify that cues are firing at the correct times.

---

### Cue Display
Below the chronometer, two lines show:
- **Cue: X / 10** — which cue is currently active out of 10 total
- **Cue name** (in cyan) — the name of the current cue (e.g. "Cue 3: Granulator")

These update automatically each time a cue fires.

---

### MODE Selector
A dropdown menu with three options. Must be selected **before** pressing START PIECE.

**Auto** — The patch runs entirely on its own. All 10 cues fire at their programmed timestamps without any operator intervention. The chronometer starts, and the piece runs to completion. At the end of the piece (8:15), everything resets automatically and the patch is ready to be started again.

**Manual** — The chronometer starts when you press START PIECE, but no sounds activate automatically. Each cue must be triggered by hand using the CUE 1–10 buttons. This mode is useful for rehearsals where you need precise control over when each sound enters.

**Practice** — No automatic playback. The operator uses the Practice slider to jump to any point in the piece and hear which sounds are active at that moment. Useful for rehearsing specific sections without running the full piece.

---

### BOOT SERVER
Boots the SuperCollider audio server, opens the level meter, and loads all sounds and audio files into memory. Must be pressed once at the beginning of each session. When the server is ready, the button turns green and reads **SERVER READY**. Only after this point can the piece be started.

---

### START PIECE / STOP
- In **Auto mode**: pressing START PIECE launches the full automated timeline. The button changes to STOP. Pressing STOP interrupts the piece and resets everything.
- In **Manual mode**: pressing START PIECE starts the chronometer. Cues are then triggered manually with the CUE buttons. Pressing STOP (or RESET) stops everything.
- In **Practice mode**: this button has no function. Use the Practice section below instead.

> **Keyboard shortcut:** pressing the **spacebar** starts the piece in Auto mode, equivalent to pressing START PIECE.

---

### MANUAL CUES (CUE 1–10)
Ten buttons, one for each cue in the piece. Available in all modes but primarily used in **Manual mode**. Pressing a button activates the corresponding cue immediately. Cues do not stop previous sounds unless explicitly programmed to do so (only Cue 9 stops all previous sounds). The buttons are arranged in two rows of five.

| Button | Cue | Time | What it does |
|--------|-----|------|--------------|
| CUE 1 | White Noise | 0:00 | Activates a soft, filtered white noise that fades in very slowly over 100 seconds |
| CUE 2 | Binaural Drift | 1:00 | Activates two low sine waves (82 and 92 Hz) slowly panning in opposite directions |
| CUE 3 | Granulator | 1:30 | Activates the first granular synthesizer, reading from `gran-buffer.wav` with reverb |
| CUE 4 | Arpeggiator | 2:00 | Activates a random arpeggiator using harmonics of E2. When specific frequencies occur, an FM chord in just intonation is triggered automatically |
| CUE 5 | Wavetable + Buffer | 3:30 | Activates two sounds simultaneously: an unstable high-frequency wavetable synthesizer, and (15 seconds later) a backwards-playing audio buffer that progressively degrades in bit depth every 5 seconds until it reaches maximum distortion |
| CUE 6 | Markov | 4:30 | Activates a melodic sine wave synthesizer that navigates pitches using a Markov chain, preferring small melodic steps |
| CUE 7 | Sub Bass | 5:50 | Activates a very low Eb sub bass (38.89 Hz) that hits immediately with full impact |
| CUE 8 | 2nd Granulator | 6:15 | Activates a second granular synthesizer reading from `gran2-buffer.wav`, heavily bitcrushed |
| CUE 9 | Harsh Interval | 7:00 | **Stops all previous sounds abruptly** and immediately activates two very high, harsh sawtooth waves a semitone apart (A7 and A#7), bitcrushed, with a hard limiter |
| CUE 10 | Fade Out | 8:00 | Fades out the Harsh Interval over 15 seconds, bringing the piece to silence at 8:15. The patch resets automatically after the fade completes |

---

### PRACTICE — Drag to Time Position
A horizontal slider that spans the full duration of the piece (0:00 to 8:15). Dragging it shows the target time in cyan to the right of the slider. This section is used in **Practice mode**.

**GO TO THIS TIME (Practice)** — pressing this button jumps to the selected time. All sounds that should be active at that moment are activated simultaneously. This does not attempt to recreate the exact state of the piece at that moment (for example, the bitcrusher degradation process will restart from the beginning), but all relevant sound sources will be running and audible.

**STOP** (red button, next to GO TO THIS TIME) — stops all sounds currently playing in Practice mode. The chronometer freezes at the current time. Use this to stop playback without resetting the clock.

---

### ⚠ PANIC
Emergency stop. Kills every sound on the audio server instantly with no fade. Use this if something goes wrong and sounds need to stop immediately. The chronometer and routines are also stopped. Does not reset the patch — use RESET after PANIC if you need to restart.

---

### ↺ RESET
Stops all sounds, stops the chronometer, clears all active processes, and returns the patch to its initial state. The display returns to "Ready to start" and the clock returns to 00:00. Use this to restart the piece after a performance or to recover from any unexpected state. After resetting, the patch is immediately ready to be started again without rebooting the server.

---

## Cue Timeline Reference

```
0:00  — Cue 1:  White Noise
1:00  — Cue 2:  Binaural Drift
1:30  — Cue 3:  Granulator
2:00  — Cue 4:  Arpeggiator
3:30  — Cue 5:  Wavetable + Buffer
4:30  — Cue 6:  Markov
5:50  — Cue 7:  Sub Bass
6:15  — Cue 8:  2nd Granulator
7:00  — Cue 9:  Harsh Interval (all previous sounds stop)
8:00  — Cue 10: Fade Out (15 seconds, ends at 8:15)
```

---

## Important Notes

- **Always boot the server before starting the piece.** The START PIECE button and CUE buttons are disabled until the server is ready.
- **The file must be saved to disk** before running. If it has never been saved, the audio files will not load correctly.
- **Do not move the audio-files folder** or rename any of its contents. The patch looks for them relative to its own location.
- **Cue 5 has a built-in 15-second delay** before the buffer starts playing. This is intentional — the wavetable sound activates immediately, and the buffer follows 15 seconds later.
- **Cue 9 stops all previous sounds abruptly.** This is a compositional choice and is expected behavior.
- In **Auto mode**, if the piece finishes normally (through Cue 10), it resets automatically. If you interrupt it early with STOP or PANIC, use RESET to return to the initial state.
- If the server is already running when you press BOOT SERVER, it will reload without rebooting. This is normal.
