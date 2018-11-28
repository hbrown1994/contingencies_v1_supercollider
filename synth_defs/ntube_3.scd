SynthDef(\ntube_3, {

	arg amp=1, atk=0.01, sus=1, rel=0.01, gate=1, out, k, loss, length_1, length_2, in;
	var input, env, sig, rms;

	input = In.ar(in);

	env = EnvGen.kr(Env.asr(atk, sus, rel), gate, doneAction:2);

	sig = TwoTube.ar(input: input, k: k, loss: loss, d1length: SinOsc.ar(0.05, {Rand(0, 2pi)}).linlin(-1, 1, 100, 700), d2length:  SinOsc.ar(0.1, {Rand(0, 2pi)}).linlin(-1, 1, 200, 1000), mul: 1, add: 0);

	sig = sig * amp.dbamp.lag(0.1) * env;

	Out.ar(out, HPF.ar(sig, 400));

}).add;