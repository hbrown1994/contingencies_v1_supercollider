SynthDef(\freeze_grain, {
	arg out=0, bufnum, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, grain_speed=1, grain_dur=0.1, amp_trig_input, grain_dev=1;
	var sig, env, chain, in, amp_trig, trig, grain_trig;

	in = In.ar(input);
	env = EnvGen.kr(Env.asr(atk, sus, rel, curve: [c1, c2]), gate, doneAction: 2);

	amp_trig = In.kr(amp_trig_input);

	trig = SetResetFF.kr(trig: Delay1.kr(amp_trig) > 0.1, reset: amp_trig > 0.1);

	chain = FFT(LocalBuf(2048), in);
	chain = PV_MagFreeze(chain, trig);
	sig = IFFT(chain);

	grain_trig = GaussTrig.kr(TGaussRand.kr(10, 30, trig), grain_dev);
	sig  = GrainIn.ar(1, grain_trig, grain_dur, sig);

	sig = Streson.ar(sig, delayTime: TGaussRand.kr(0.05, 0.5*pi, grain_trig).lag(0.1), res: 0.8, mul: 1, add: 0);

	sig = sig * env * amp.dbamp.lag(0.1);

	Out.ar(out, sig);

}).add;