SynthDef(\wild_delay_1, {
	arg out=0, bufnum, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, thresh;
	var source,timer,grains, timer_trig,trig_grains, capture, sig, amplitude, rand_delay, rand_strech, chain, sig_out, freeze, chain_1, rand_delay_1, rand_delay_2, rand_delay_3, delay_amp, freeze_trig, sig_1, env;

	source= In.ar(input);

	env = EnvGen.kr(Env.asr(atk, sus, rel), gate, doneAction: 2);
	amplitude = Amplitude.kr(source);

	rand_delay_1 = TRand.kr(lo: 0.05, hi: 0.2, trig: Dust.kr(5)).lag(0.05);
	rand_delay_2 = TRand.kr(lo: 0.201, hi: 0.6, trig: Dust.kr(5)).lag(0.05);
	rand_delay_3 = TRand.kr(lo: 0.601, hi: 1, trig: Dust.kr(5)).lag(0.05);

	sig = MultiTap.ar([rand_delay_1, rand_delay_2, rand_delay_3], [1, 1, 1], in: source, mul: 1, add: 0, bufnum: bufnum);

	delay_amp= Amplitude.kr(sig);

	freeze_trig = TIRand.kr(0, 1, delay_amp > thresh);

	timer = Sweep.kr(trig: freeze_trig, rate: 1);

	grains = GrainIn.ar(1, GaussTrig.kr(10, 1), 0.2, sig);

	timer_trig = Select.kr(timer > 2, [freeze_trig, 0]);

	chain = FFT(LocalBuf(2048), sig);
	chain = PV_MagFreeze(chain, ToggleFF.kr(Dust.kr(2)));
	chain = PV_BinScramble(chain, wipe: TRand.kr(0, 0.1, GaussTrig.kr(10, 1)).lag(0.05), width: 1, trig: timer_trig);
	chain = PV_BinShift(chain, stretch: TRand.kr(0.6, 2, GaussTrig.kr(10, 1)), shift: 0, interp: 0);

	sig_out = IFFT(chain);
	grains = GrainIn.ar(1, GaussTrig.kr(10, 1), 0.2, sig);
	sig_out = SelectX.ar(TIRand.kr(0, 1, GaussTrig.kr(10, 1)).lag(0.1), [grains, sig_out]);
	sig_out = sig_out * amp.dbamp.lag(0.1) * env;

	Out.ar(out, sig_out);
}).add;