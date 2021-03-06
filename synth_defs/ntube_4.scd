SynthDef(\ntube_4, {

	arg amp=1, atk=0.01, sus=1, rel=0.01, gate=1, out, in, k, loss, length_1, length_2, speed=0.01;
	var input, env, sig, rms;

	input = In.ar(in);

	env = EnvGen.kr(Env.asr(atk, sus, rel), gate, doneAction:2);

	rms = RMS.kr(input);

	sig = (NTube.ar(input,`[0.97,1.0,1.0,1.0,1.0,0.97],`[0.5,LFBrownNoise1.kr(0.1).linlin(-1.0,1.0, 0.75, 0.99999),0.2,-0.4],`([0.01,0.02,0.01,0.005,0.05]*LFBrownNoise1.kr(0.1).linlin(-1.0,1.0, 0.01, 0.04)))*0.5);


	sig = sig * amp.dbamp.lag(0.1) * env;

	Out.ar(out, HPF.ar(sig, 100));

}).add;