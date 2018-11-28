SynthDef(\input_sum, {
	arg amp =(-6), gate=1, rel=0.1, atk=0.005, sus=1, dec=0.1, outs, loop=1, start_pos, out;
	var env, in_1, in_2, in_3, sum_sig;
	in_1 = In.ar(~trumpet_send);
	in_2 =  In.ar(~bass_send);
	in_3 =  In.ar(~percussion_send);
	sum_sig = Mix.new([in_1, in_2, in_3]);
	env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, sustainLevel: 1.0), gate, doneAction:2);
	Out.ar(~input_sum_send, sum_sig);
}).add;