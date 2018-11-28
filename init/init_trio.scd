~rehearsal_mode = 0;
~computer_has_soloed = 0;

~index=0;

Routine({

	~trumpet_mic = Synth(\trumpet, [\gate, 1], target: ~input);
	~bass_mic = Synth(\bass, [\gate, 1], target: ~input);
	~percussion_mic = Synth(\percussion, [\gate, 1], target: ~input);

	~trumpet_amp_tracking = Synth(\amp_tracking, [\thresh, 0.1, \input, ~trumpet_send, \peak_send, ~trumpet_peak_send, \rms_send, ~trumpet_rms_send, \peak_trig_send, ~trumpet_peak_trig_send], target: ~amp_tracking);
	~bass_amp_tracking = Synth(\amp_tracking, [\thresh, 0.1, \input, ~bass_send, \peak_send, ~bass_peak_send, \rms_send, ~bass_rms_send, \peak_trig_send, ~bass_peak_trig_send], target: ~amp_tracking);
	~percussion_amp_tracking = Synth(\amp_tracking, [\thresh, 0.1, \input, ~percussion_send, \peak_send, ~percussion_peak_send, \rms_send, ~percussion_rms_send, \peak_trig_send, ~percussion_peak_trig_send], target: ~amp_tracking);

	~computer_solo_array = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].scramble;
	~computer_solo_array_index = 0;

	~drums_1_array =  Array.series(b[\drums_1].size, 0, 1).scramble;
	~drums_1_array_index = 0;

	~sub_1_array =  Array.series(b[\sub_1].size, 0, 1).scramble;
	~sub_1_array_index = 0;

	~sub_2_array =  Array.series(b[\sub_2].size, 0, 1).scramble;
	~sub_2_array_index = 0;

	~zero_noise_1_array = Array.series(b[\zero_noise_1].size, 0, 1).scramble;
	~zero_noise_2_array = Array.series(b[\zero_noise_2].size, 0, 1).scramble;
	~zero_noise_3_array = Array.series(b[\zero_noise_3].size, 0, 1).scramble;
	~zero_noise_4_array = Array.series(b[\zero_noise_4].size, 0, 1).scramble;
	~zero_high_tone_1_array = Array.series(b[\zero_high_tone_1].size, 0, 1).scramble;
	~zero_buzz_1_array = Array.series(b[\zero_buzz_1].size, 0, 1).scramble;

	~zero_noise_1_array_index = 0;
	~zero_noise_2_array_index = 0;
	~zero_noise_3_array_index = 0;
	~zero_noise_4_array_index = 0;
	~zero_high_tone_1_array_index = 0;
	~zero_buzz_1_array_index = 0;

	~three_asmr_1_array = Array.series(b[\three_asmr_1].size, 0, 1).scramble;
	~three_glitch_1_array = Array.series(b[\three_glitch_1].size, 0, 1).scramble;
	~three_high_sine_1_array = Array.series(b[\three_high_sine_1].size, 0, 1).scramble;
	~three_noise_1_array = Array.series(b[\three_noise_1].size, 0, 1).scramble;

	~three_asmr_1_array_index = 0;
	~three_glitch_1_array_index = 0;
	~three_high_sine_1_array_index = 0;
	~three_noise_1_array_index = 0;

	~sparse_crunch_array  = Array.series(b[\sparse_crunch].size, 0, 1).scramble;
	~sparse_crunch_array_index = 0;


	~four_pulse_1_array = Array.series(b[\four_pulse_1].size, 0, 1).scramble;
	~four_pulse_2_array = Array.series(b[\four_pulse_2].size, 0, 1).scramble;

	~four_pulse_1_array_index = 0;
	~four_pulse_2_array_index = 0;

	~seven_drone_1_array = Array.series(b[\seven_drone_1].size, 0, 1).scramble;

	~seven_drone_1_array_index = 0;

	~eight_drone_1_array = Array.series(b[\eight_drone_1].size, 0, 1).scramble;
	~eight_noise_1_array = Array.series(b[\eight_noise_1].size, 0, 1).scramble;

	~eight_drone_1_array_index = 0;
	~eight_noise_1_array_index = 0;

	~field_recording_1_array = Array.series(b[\field_recording_1].size, 0, 1).scramble;
	~field_recording_2_array = Array.series(b[\field_recording_2].size, 0, 1).scramble;
	~field_recording_3_array = Array.series(b[\field_recording_3].size, 0, 1).scramble;

	~field_recording_1_array_index = 0;
	~field_recording_2_array_index = 0;
	~field_recording_3_array_index = 0;

	s.sync;

	~random_index = Array[0, 2, 3, 4, 5, 6, 7, 8, 9, 1, 0, 2, 3, 4, 5, 6, 7, 8, 9, 1];

	~random_index =  ~random_index.scramble;

	~random_index_index = 0;

	~pre_array = Array[0, 2, 3, 4, 5, 6, 7, 8, 9, 1];

	s.sync;

	~pre_array = ~pre_array.sputter(probability: 0.25, maxlen: 13);

	0.1.wait;

	~pre_array = ~pre_array.scramble;

	s.sync;

	~pre_array = ~pre_array.reverse;

	s.sync;

	if(~pre_array.size <= 12, {

		Routine({
			~pre_array.add(~random_index.at(~random_index_index));
			0.05.wait;
			~random_index_index = ~random_index_index + 1;

		}).play(AppClock);
	});

	s.sync;

	if(~pre_array.size <= 12, {
		Routine({
			~pre_array.add(~random_index.at(~random_index_index));
			0.05.wait;
			~random_index_index = ~random_index_index + 1;

		}).play(AppClock);

	});

	s.sync;

	~array = ~pre_array;

	s.sync;

	~array_size = ~array.size.asInt;

	s.sync;

	~array.postln;

	s.sync;

	~cue = ~array.at(~index.asInt);

	s.sync;

	~clock = Synth(\clock, [\reset, 1, \min, 36, \max, 37]);

	s.sync;

	~easter_egg_array = [[0,2,0,3,0,0], [2,0,3,0,0,0], [3,0,0,2,0,0], [0,0,2,0,3,0], [0,0,3,0,2,0]].scramble.at(1);


	s.sync;

	~easter_egg_index = 0;

	Ndef(\oscValues_processing, {
		var data= In.kr(~osc_bus, 1);
		var trig= Changed.kr(data);
		SendReply.kr(trig, "/innerOscFlow_processing", data);
	});

	s.sync;

	(
		~to_processing = OSCFunc({ arg msg, time;
			msg = msg ++ ~cue.asArray ++ ~array ++ ~index.asArray;
			~host.sendMsg("/trigger",*msg[3..]);
		}, "/innerOscFlow_processing",s.addr );
	);

	Synth(\key);

	Ndef(\oscValues_keys, {
		var data_a= In.kr(~a_key_bus, 1);
		var data_b= In.kr(~b_key_bus, 1);
		var trig_a= Changed.kr(data_a);
		var trig_b= Changed.kr(data_b);
		SendReply.kr(trig_a, "/innerOscFlow_key_a", data_a);
		SendReply.kr(trig_b, "/innerOscFlow_key_b", data_b);
	});


	(
		OSCFunc({ arg msg;
			~a_trig = msg[3];
		}, "/innerOscFlow_key_a");
	);

	(
		OSCFunc({ arg msg;
			~b_trig = msg[3];
		}, "/innerOscFlow_key_b");
	);

	~key_triggers = Routine({

		loop{
			if(~a_trig == 1, {e[\10].value}, {nil});
			if(~b_trig == 1, {e[\19].value}, {nil});

			0.5.wait;
		}
	}).play(SystemClock);

}).play(AppClock);