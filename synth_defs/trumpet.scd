SynthDef(\trumpet, {

	arg amp =(-6), gate=1, rel=0.1, atk=0.005, sus=1, dec=0.1, outs, loop=1, start_pos, out;
	var env, in, in_contact;
	in = SoundIn.ar(~trumpet_in);
	in_contact = SoundIn.ar(~trumpet_contact_in);
	env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, sustainLevel: 1.0), gate, doneAction:2);
	Out.ar(~trumpet_send, in);

}).add;