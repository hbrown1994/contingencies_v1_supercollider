SynthDef(\percussion, {

	// Amplitude, Envelope, and Buffer Assignments
	arg amp =(-6), gate=1, rel=0.1, atk=0.005, sus=1, dec=0.1, outs, loop=1, start_pos, out;

	// Variables
	var env, sig, sig_dry, oh_l, oh_r, oh_c, snare, brake, floor, kick, picc, no_input, sum_sig, hat;

	// Mic In
	oh_l = SoundIn.ar(~oh_l);
	oh_r = SoundIn.ar(~oh_r);
	kick = SoundIn.ar(~kick_in);
	snare = SoundIn.ar(~snare_in);
	hat = SoundIn.ar(~hat_in);

	// Envelope & Mono Sum
	env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, sustainLevel: 1.0), gate, doneAction:2);
	sum_sig = Mix.new([oh_l, oh_r, /*oh_c,*/ kick, snare, hat]);

	// Summed Bus Send
	Out.ar(~percussion_send, sum_sig);

}).add;
