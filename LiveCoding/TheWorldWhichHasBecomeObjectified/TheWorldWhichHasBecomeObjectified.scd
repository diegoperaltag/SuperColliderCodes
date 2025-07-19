// =====================================================================
// THE WORLD WHICH HAS BECOME OBJECTIFIED
// Diego Peralta-Gonzales, November 2024
// Boston, MA
// =====================================================================

//  INITIALIZE

s.meter;
s.boot;
p = ProxySpace.push;

// SIN OSC

~sig.play;
~sig.fadeTime = 5;

(
~sig = {
	var snd;

	snd = SinOsc.ar([440,450] * -20.midiratio) * -6.dbamp * LFPulse.kr(100, 0, 0.3);

	snd = DelayC.ar(snd,0.5,0.5,0.6);

	snd = HPF.ar(snd,900,0.8);

	snd = FreeVerb.ar(snd, 1, 1, 0.9);

}
)

~sig.free(0.6);

// SEQUENCER //

~sig2.play;
~sig2.fadeTime = 2;

(
    ~sig2 = { |rate=0.5, amp=0.15, modRate=10,
               roomSize=29, revTime=10, mix=0.5|
        var a, durations, trig, oscArray, sigMono, reverb, out;

        a = [[2,4.5],[5,6,8,10]];
        durations = (a *.x allTuples(a *.x a) * 2).flat.clump(6) ++ [0];

        trig     = Duty.ar(rate, 0, Dseq(durations, inf));
        oscArray = SinOsc.ar(trig, 0, amp) * LFTri.ar(modRate);

        sigMono  = Mix.new(oscArray);

        reverb   = GVerb.ar(sigMono, roomSize, revTime);

        out      = XFade2.ar(sigMono, reverb, mix * 2 - 1);

        out * 0.050
    };

    ~sig2.play;
)

~sig2.free(20);


// PINK NOISE

~x.play(vol:0.25);
~x.fadeTime = 2;

(
~x = {
	var snd;

	snd = LFSaw.ar(-20.dbamp!2) * LFPulse.kr(110, 0);

	snd = FreeVerb.ar(snd, 1, 1, 0.9);

	//snd = Decimator.ar(snd, rate: 44100.0, bits: 5);
}
)

~x.free(0.5);

// FM SYNTH

~fm.fadeTime_(4).play(vol: 0.020);
~fm2.fadeTime_(2);

(
~fm = {SinOsc.ar([200, 202] +
	(~fm2.ar(2, LFSaw.ar().unipolar(5)) * 6000),
	0, 0.2)}
)

(
~fm2 = {SinOsc.ar(24 * 2)}
)

(
~fm.free(10);
~fm2.free(10);
)


// NOISE GENERATOR

~z.quant_(1).fadeTime_(2).play(vol: 0.2);

(
~z = {
	arg freq=196, amp=0.7;
	var snd;
	snd=Mix.ar(
		Array.fill(5,{arg i; LFClipNoise.ar(freq:freq*(4**(i/4)), mul:0.020)})
	);
	snd=snd+(0.4*Mix.ar(
		VarSaw.ar(freq:[freq,freq*1.5,freq*2.2,freq*3.1],mul:0.020))
	);

	snd=Splay.ar(snd);
}
)

~z.free(2);

// BUFFERS

//SPEECH
f = ();
f.put(\sample5, Buffer.read(s,"/Users/diegoperalta/Documents/SuperCollider Patches/TheWorldWhichHasBecomeObjectified/Samples/speech.wav"));
//h.sample5.play;

~buf5.play (vol: 0.8);
~buf5.fadeTime = 0.5;

(
~buf5 = {
	arg bufnum = 0;
	var snd;

	snd = PlayBuf.ar(
		2,
		f.sample5,
		loop:0,
		rate:0.78,
	) * 0.15.dbamp!2;

	snd = FreeVerb.ar(snd, 0.6, 0.4, 0.5);
}
)

~buf5.free(0.5);


// ANALOG NOISE

b = ();
b.put(\sample, Buffer.read(s,"/Users/diegoperalta/Documents/SuperCollider Patches/TheWorldWhichHasBecomeObjectified/Samples/analog_noise_3.wav"));
//b.sample.play;

~buf.play (vol: 0.8);
~buf.fadeTime = 2;

(
~buf = {
	arg bufnum = 0;
	var snd;

	snd = PlayBuf.ar(
		2,
		//bufnum,
		b.sample,
		loop:1,
		rate:27.5,
	) * 0.15.dbamp!2;

	snd = Pan2.ar(snd,LFNoise2.kr(1));

	snd = BPF.ar(snd,220,0.5,0.5);

	snd = DelayC.ar(snd,0.5,0.7);

	snd = (snd * SinOsc.kr(15,0,0.4).range(1,10)).tanh * 0.15;

	// Out.ar(0,snd);
})

~buf.free(2);

// PREPARED GUITAR

c = ();
c.put(\sample2, Buffer.read(s,"/Users/diegoperalta/Documents/SuperCollider Patches/TheWorldWhichHasBecomeObjectified/Samples/prepared_guitar.wav"));
//c.sample2.play;

~buf2.play (vol: 0.8);
~buf2.fadeTime = 2;

(
~buf2 = {
	arg bufnum = 0;
	var snd;

	snd = PlayBuf.ar(
		2,
		c.sample2,
		-1.midiratio,
		loop:1,
		rate:-0.5
	) * 0.15.dbamp!2;

	snd = Pan2.ar(snd,LFNoise2.kr(2));

	snd = RLPF.ar(snd,440,0.5);

	snd = CombC.ar(snd,0.5,0.2);

	snd = (snd * SinOsc.kr(0.1).range(1,10)).tanh * 0.2;

	// Out.ar(0,snd);
})

~buf2.free(2);

//SCRAPING

d = ();
d.put(\sample3, Buffer.read(s,"/Users/diegoperalta/Documents/SuperCollider Patches/TheWorldWhichHasBecomeObjectified/Samples/scrapping_sample.wav"));
// d.sample.play;

~buf3.play;
~buf3.fadeTime = 2;

(
~buf3 = {
	arg bufnum = 0;
	var snd;

	snd=PlayBuf.ar(
		2,
		d.sample3,
		-1.midiratio,
		loop: 1,
		rate:20.5
	);

	snd = Pan2.ar(snd,LFNoise2.kr(1));

	snd = HPF.ar(snd,880,0.4);

	snd = DelayC.ar(snd,0.5,0.2,0.10);
	snd = (snd * SinOsc.kr(0.1, 0.0, 0.1).range(1,10)).tanh * 0.9;

    //snd = Decimator.ar(snd, rate: 44100.0, bits: 2).tanh * 0.08;

	snd = FreeVerb.ar(snd, 0.9, 1.2, 0.5);

	//Out.ar(0,snd);
})

~buf3.free(2);

// TAPPING //

e = ();
e.put(\sample4, Buffer.read(s,"/Users/diegoperalta/Documents/SuperCollider Patches/TheWorldWhichHasBecomeObjectified/Samples/tappin_sample.wav"));
// e.sample.play;

~buf4.play(vol: 0.9);
~buf4.fadeTime = 2;

(
~buf4 = {
	arg bufnum = 0;
	var snd;

	snd=PlayBuf.ar(
		2,
		e.sample4,
		10.midiratio,
		loop: 1,
		rate:2.5
	);

	snd = Pan2.ar(snd,LFNoise2.kr(1));

	snd = HPF.ar(snd,880,0.4);

	snd = DelayC.ar(snd,0.5,0.2,0.6);
	snd = (snd * SinOsc.kr(0.1, 0.0, 0.1).range(1,10)).tanh * 0.75;

	snd = FreeVerb.ar(snd, 0.9, 1.2, 0.5);

	//snd = Decimator.ar(snd, rate: 44100.0, bits: 5).tanh * 0.4;

	//Out.ar(0,snd);
})

~buf4.free(2);


//STOP BY GROUPS

(
~sig.clear;
~sig2.clear;
~fm.clear;
~fm2.clear;
~x.clear;
~y.clear;
~z.clear;
)

(
~buf.clear;
~buf2.clear;
~buf3.clear;
~buf4.clear;
~buf5.clear;
)

// FINISH THE PIECE //

p.free(20);
p.free(0.5);





