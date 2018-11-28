SynthDef(\buf_write, {
	arg out, bufnum, input, loop=0, buff_time, rate=1;
	var source, capture, phase, trig;

	phase = Phasor.ar(0, 1, 0, BufFrames.ir(bufnum));

	trig = SetResetFF.ar(trig: phase < 1, reset: phase > ((BufFrames.ir(bufnum)-(s.sampleRate/10))-1));

	source= HPF.ar(In.ar(input), 30);

	source= source * EnvGen.ar(Env.asr(0.1, 0.9, 0.1, curve: \lin), trig, doneAction: 0);

	capture= RecordBuf.ar(source, bufnum, trigger: trig, loop: loop, doneAction: 2);

}).add;