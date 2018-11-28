SynthDef(\bass_pitch, {
	arg out=0, bufnum, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, grain_speed=1, grain_dur=0.1, amp_input;
	var sig, env, chain, in, amp_trig, trig, grain_trig, amp_in;

	in = In.ar(input);
	amp_in = In.kr(amp_input);

	env = EnvGen.kr(Env.asr(atk, sus, rel, curve: [c1, c2]), gate, doneAction: 2);

	chain = FFT(LocalBuf(2048), in);
	chain = PV_MagSmooth(chain, 1 - Clip.kr(Sweep.kr(trig: amp_in, rate: 20).linlin(0, 1, 1, 0), 0.000118281, 1)); //0.000118281
	chain = PV_SpectralEnhance(chain, 4, 2, 0.2);
	sig = IFFT(chain);

	sig = PitchShift.ar(sig, pitchRatio: Clip.kr(Sweep.kr(trig: amp_in, rate: 0.05).linlin(0, 1, 1, 0.3), 0.3, 1));

	sig = sig * env * amp.dbamp.lag(0.1);

	Out.ar(out, sig);

}).add;
