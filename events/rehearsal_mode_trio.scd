//A mode for rehearsing individual modules

~update_cue_array = Routine({
	loop{
		~cue_array = [~cue, ~cue, ~cue, ~cue, ~cue, ~cue, ~cue, ~cue, ~cue, ~cue, ~cue, ~cue, ~cue];
		0.5.wait;
	}
}).play;

~rehearsal_mode = 1;

~index=0;

Routine({

	~trumpet_mic = Synth(\trumpet, [\gate, 1], target: ~input);
	~bass_mic = Synth(\bass, [\gate, 1], target: ~input);
	~percussion_mic = Synth(\percussion, [\gate, 1], target: ~input);
	~trumpet_amp_tracking = Synth(\amp_tracking, [\thresh, 0.1, \input, ~trumpet_send, \peak_send, ~trumpet_peak_send, \rms_send, ~trumpet_rms_send, \peak_trig_send, ~trumpet_peak_trig_send], target: ~amp_tracking);
	~bass_amp_tracking = Synth(\amp_tracking, [\thresh, 0.1, \input, ~bass_send, \peak_send, ~bass_peak_send, \rms_send, ~bass_rms_send, \peak_trig_send, ~bass_peak_trig_send], target: ~amp_tracking);
	~percussion_amp_tracking = Synth(\amp_tracking, [\thresh, 0.1, \input, ~percussion_send, \peak_send, ~percussion_peak_send, \rms_send, ~percussion_rms_send, \peak_trig_send, ~percussion_peak_trig_send], target: ~amp_tracking);

	~cue = 0;

	s.sync;


	~clock = Synth(\clock, [\reset, 1, \min, 35, \max, 36]);

	s.sync;

	Ndef(\oscValues_processing, {
		var data= In.kr(~osc_bus, 1);
		var trig= Changed.kr(data);
		SendReply.kr(trig, "/innerOscFlow_processing", data);
	});

	s.sync;

	(
		~to_processing = OSCFunc({ arg msg, time;
			msg = msg ++ ~cue.asArray ++ ~cue_array ++ ~index.asArray;
			~host.sendMsg("/trigger",*msg[3..]);
		}, "/innerOscFlow_processing",s.addr );
	);

}).play(AppClock);