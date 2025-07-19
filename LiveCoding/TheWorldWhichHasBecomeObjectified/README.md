# The world which has become objectified
### for live coding in SuperCollider
---
> "The spectacle cannot be understood as the abuse of a world of vision, as the product of the techniques of mass dissemination of images. It is, rather, a *Weltanschauung* which has become actual, materially translated. It is a vision of **the world which has become objectified**." - Guy Debord
 
Program Notes:

`The world which has become objectified` is a live-coded composition built in SuperCollider, developed as a sonic response to the conditions under which artistic labor, performance, and technological authorship are rendered extractable, reproducible, and consumable. It is not a sonic object in the traditional sense, but a system performed in real time—constructed through procedural logic, layered accumulation, and resistance to narrative teleology. Rather than delivering a polished product, the work foregrounds process, saturation, and code as material.

The decision to compose entirely in a free/libre open-source environment is central. SuperCollider offers a framework that diverges from commercial production platforms and their logics of seamlessness, optimization, and ownership. Here, the act of composition becomes inseparable from the ethics of tool-making. While the piece can be documented, recorded, and revisited, its formal logic resists flattening: what is recorded is not a version, but a trace—one realization among many, framed by the contingencies of execution.

The work unfolds through a recursive layering of sonic procedures—not toward resolution, but toward density and complexity. Its form is not developmental but accretive. Each segment contributes to a slow build-up of processual pressure, challenging conventional expectations of climax, coherence, or interpretability. The listener is not guided through a structure, but immersed within one—invited to inhabit a temporal system where accumulation takes precedence over progression.

`The world which has become objectified` does not seek to express critique through theme or metaphor; it enacts critique through form. It resists being reduced to a reproducible object not by disappearing, but by asserting that presence, authorship, and compositional identity can be reframed. In doing so, it proposes a mode of composing that is less about making something to be consumed, and more about composing as intervention—into code, into sound, and into the systems that seek to contain them.

Dedicated to my SuperCollider professor [Rachel Rome](https://racheldevorah.studio/about/), who made this piece possible.

---

### About the code

This piece is made up of a collection of sound processes (Proxies) that are defined and controlled independently. Each process (e.g.,` ~sig`, `~sig2`, `~x`, `~fm`, `~z`, etc.) contributes a different sonic layer — from sine oscillators and noise generators to FM synthesis and granulated buffers.

The proxies are activated, crossfaded, and freed manually, making the piece flexible, performative, and nonlinear. It invites improvisation and interpretive control by the performer. There is no fixed timeline or sequence: the piece evolves through live decisions.

---

### Performance Instructions

Below is a recommended set of instructions for performing the piece or exploring it interactively:

1. **Initialize Audio:** <br/>
`s.boot;`<br/>
`p = ProxySpace.push;`

2. **Start with a Core Texture:** <br/>
`sig.play~`<br/>
 This uses filtered sine tones with delay, high-pass filtering, and reverb.
 
3. **Introduce Variations:** <br/>
`~sig2.play;`<br/>
`~x.play(vol: 0.25);`<br/>
`~fm.play(vol: 0.02);`<br/>
`~z.play(vol: 0.2);`<br/>

 Each of these brings a different texture:

     `~sig2`: pulse-triggered sine oscillators with generative timing <br/>
     `~x`: pink noise-like saw textures <br/>
     `~fm` + `~fm2`: modulated FM synthesis <br/>
     `~z`: dense noise-based texture using LFClipNoise and VarSaw <br/>

4. **Parameter Exploration**: <br/>
 Many proxies accept arguments. For example:

  `~sig2.set(\rate, 0.3, \modRate, 5);`<br/>
  `~z.set(\freq, 150);`
 
 You are encouraged to explore these parameters in real time, adjusting density, frequency, or modulation behavior to shape the sonic landscape.
 
5. **Layer and Crossfade**: <br/>
Use `.fadeTime` to smoothly introduce or remove elements: <br/>
`~fm.fadeTime_(4);`<br/>
`~sig.fadeTime = 5;`<br/>
`~x.free(2);`<br/>

6. **Conclude Freely**: <br/>
There's no “ending” prescribed. Free each layer gradually, or let them decay organically:
`~sig.free(5);`<br/>
`~sig2.free(10);`<br/>
`~fm.free(5);`<br/>

---

### Experimental Focus
The work is not just a performance piece, but also an exploratory sound environment. It allows you to:

    Combine digital synthesis methods (FM, subtractive, noise-based)

    Improvise structure and texture

    Investigate spatial and timbral layering in real time
---

### License
This piece is distributed under the **GNU General Public License v3.0**.
You are free to use, modify, and redistribute the code, provided that any derivative works remain under the same license.


