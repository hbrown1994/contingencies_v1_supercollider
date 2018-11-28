SynthDef(\amp_tracking, {
	arg thresh=0.1, input, peak_send, rms_send, peak_trig_send, trackFall=0.2, slowLag=0.2, fastLag=0.01, fastMul=0.5, minDur=0.1;
	var in, peak, rms, peak_trig;

	in = In.ar(input);

	peak = Amplitude.kr(in);
	rms = RMS.kr(in);
	peak_trig = Amplitude.kr(in) > thresh;

	Out.kr(peak_send, peak);
	Out.kr(rms_send, rms);
	Out.kr(peak_trig_send, peak_trig);

}).add;