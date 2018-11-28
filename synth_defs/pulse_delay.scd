SynthDef(\pulse_delay, {
	arg out=0, bufnum=~pulse_buffer_1, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, amp_input, thresh, pitch_low=0.5, pitch_hi=1.2, delay_low=0.8, delay_hi=1, delay_factor=0.5;
	var sig, env, in, amp_in, freq, freq_init, trig, rand_freq, delay_trig;

	in = In.ar(input);
	amp_in = In.kr(amp_input);

	env = EnvGen.kr(Env.asr(atk, sus, rel, curve: [c1, c2]), gate, doneAction: 2);

	sig  = SwitchDelay.ar(in, wetlevel: 1, delaytime: {Rand(delay_low, delay_hi)}, delayfactor: delay_factor);

	delay_trig = Dust.kr(1);

	sig = PitchShift.ar(in: sig, windowSize: 0.2, pitchRatio: TRand.kr(pitch_low, pitch_hi, delay_trig).lag(1), pitchDispersion: 0.1, timeDispersion: 0.1, mul: 1, add: 0);

	sig = sig * env * amp.dbamp.lag(0.1);

	Out.ar(out, sig);

}).add;