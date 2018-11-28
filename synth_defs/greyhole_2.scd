SynthDef(\greyhole_2, {

	arg amp=1, atk=0.01, sus=1, rel=0.01, gate=1, array_size=1, array_low=1, array_high=1, bits=3, line_start, line_end, line_dur, in, out, pan=(-1), damping=0;
	var input, env, sig,freq_val,bass_in, phase_val, rhythm_array_1, rhythm_array_2, rhythm_array_3, rhythm_array_4, rhythm_array_5, trig_amp, rhythm_val_1, rhythm_val_2, rhythm_val_3, rhythm_val_4, array, rms, pitch, ring, sig1;

	input = In.ar(in, 1);

	env = EnvGen.kr(Env.asr(atk, sus, rel), gate, doneAction:2);

	ring = input * SinOsc.ar({Rand(80, 120)});

	sig = GreyholeRaw.ar(input, ring, damping: damping, delaytime: SinOsc.kr(4, {Rand(0, 2pi)} ).linlin(-1, 1, 0.01, 1), diffusion: 0.5, feedback: 0.4, moddepth: SinOsc.kr(3, {Rand(0, 2pi)} ).linlin(-1, 1, 1, 49), modfreq: SinOsc.kr(2, {Rand(0, 2pi)} ).linlin(-1, 1, 1, 10), size: 0.1)!1;

	sig = sig * amp.dbamp.lag(0.1) * env;

	sig1 = CrossoverDistortion.ar(sig, amp: 0.1, smooth: 0.1, mul: 1, add: 0);

	sig = XFade2.ar(sig, LPF.ar(sig1, 1000), pan.lag(10));

	Out.ar(out, HPF.ar(sig, 100));

}, [20]).add;