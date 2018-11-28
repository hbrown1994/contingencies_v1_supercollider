/*________________________________________________ LIVE PROCESSING __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{

		~five_fx_routine = Task({
			thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

			s.sync;

			~percussion_fx_5 = Synth(\greyhole_perc, [\amp, 0, \gate, 1, \rel, 0.05, \in, ~percussion_send , \out, ~percussion_out, \damping, 0.5, \fb, 0.1, \res, 0.8, \size, 0.1, \dif, 0.2, \low, 0.01, \hi, 0.015, \low_1, 0.5, \hi_1, pi], target: ~eight_fx_node).register;


			~trumpet_fx_5 = Synth(\concat_convolve, [\input, ~trumpet_send, \out, ~trumpet_out, \gate, 1, \bufnum, b[\algo_bank_1][1], \zcr, 0.5, \lms, 0.5, \sc, 1, \st, 0, \matchlength, 0.05, \rel, 0.05], target: ~one_fx_node).register;
			~bass_fx_5 = Synth(\concat_bass, [\input, ~bass_send, \out, ~bass_out, \gate, 1, \bufnum, b[\drums_2][0], \zcr, 0.1, \lms, 0.1, \sc, 1 , \st, 0.2, \matchlength, 0.05], target: ~one_fx_node).register;

			67.wait;
			~trumpet_fx_5.set(\gate, 0);
			~trumpet_fx_5_1 = Synth(\ntube_9, [\amp, -12, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~trumpet_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~trumpet_out, \amp_input_bus,~trumpet_rms_send, \amp_input_bus_trig, ~trumpet_peak_trig_send], target: ~nine_fx_node).register;

			11.5.wait; //01:18
			~trumpet_fx_5_1.set(\gate, 0);
			~trumpet_fx_5_2 = Synth(\greyhole_1, [\amp, 0, \gate, 1, \rel, 0.05, \in, ~trumpet_send , \out, ~trumpet_out, \damping, 0], target: ~eight_fx_node).register;

			16.5.wait; //01:25

			~trumpet_fx_5 = Synth(\concat_convolve, [\input, ~trumpet_send, \out, ~trumpet_out, \gate, 1, \bufnum, b[\algo_bank_1][1], \zcr, 0.5, \lms, 0.5, \sc, 1, \st, 0, \matchlength, 0.05, \rel, 0.05], target: ~one_fx_node).register;

			~trumpet_fx_5_2.set(\gate, 0);


		}).start(SystemClock);
	},

/*________________________________________________ REPEAT __________________________________________*/

	{~five_fx_routine = Task({


		67.wait;
		~trumpet_fx_5.set(\gate, 0);
		~trumpet_fx_5_1 = Synth(\ntube_9, [\amp, -12, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~trumpet_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~trumpet_out, \amp_input_bus,~trumpet_rms_send, \amp_input_bus_trig, ~trumpet_peak_trig_send], target: ~nine_fx_node).register;

		11.5.wait; //01:18
		~trumpet_fx_5_1.set(\gate, 0);
		~trumpet_fx_5_2 = Synth(\greyhole_1, [\amp, 0, \gate, 1, \rel, 0.05, \in, ~trumpet_send , \out, ~trumpet_out, \damping, 0], target: ~eight_fx_node).register;

		16.5.wait; //01:25

		~trumpet_fx_5 = Synth(\concat_convolve, [\input, ~trumpet_send, \out, ~trumpet_out, \gate, 1, \bufnum, b[\algo_bank_1][1], \zcr, 0.5, \lms, 0.5, \sc, 1, \st, 0, \matchlength, 0.05, \rel, 0.05], target: ~one_fx_node).register;

		~trumpet_fx_5_2.set(\gate, 0);


}).start(SystemClock);});

/*________________________________________________ SAMPLE PLAYBACK __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{
		~five_samples_routine = Task({ ~clock.set(\reset, 1);


			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

			//00:00

			~sub = Synth(\playbuf, [\bufnum, b[\sub_1][~sub_1_array.at(~sub_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 10, \rel, 20, \out, 3, \c1, 4, \c2, -8], target: ~five_samples_node).register;

			~trumpet_noise_1 = Synth(\playbuf, [\bufnum, b[\trumpet_noise_1][0], \loop, 0, \gate, 1, \amp, -12, \atk, 0.05, \rel, 60, \out, 4, \c1, 8, \c2, -8], target: ~five_samples_node).register;

			s.sync;

			if(~sub_1_array_index > (~sub_1_array.size - 2), {Routine({~sub_1_array = ~sub_1_array.scramble; s.sync; ~sub_1_array_index=0;}).play(SystemClock)}, {~sub_1_array_index = ~sub_1_array_index + 1});

			15.wait; //15 secs

			~sub.set(\gate, 0);

			~five_sample_stream = Pdef(
				\five_sample_stream,
				Pbind(
					\instrument, \pattern_buf,
					\dur, Pwrand([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 5, 6, 7], (Array.rand(6, 9, 10)++Array.rand(3, 6, 8)).normalizeSum, inf),
					\atk, 0.005,
					\rel, Pwrand([0.005, 0.1, 0.5, 1], [9, 8, 0.5, 0.5].normalizeSum, inf),
					\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
					\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
					//              Seoul             Eric                Nature              Glitch              Piano
					\buf, Pwrand([m[\trumpet_feedback_2][0], m[\trumpet_noise_1][0], m[\bass_feedback_2][(0..3)]], [5, 7, 5].normalizeSum, inf),
					\rate, Pwrand([-10, 10, -8, 8, -6, 6, 4, -4, 2, -2, 1, -1, 0.8, -0.8],  (Array.rand(8, 4, 6)++Array.rand(6, 9, 10)).normalizeSum, inf),
					\spos, Pwhite(0, 36825483),
					\loop, 1,
					\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
					\pan_pos, -1.0,
					\low_pass_mix, 0,
					\low_pass_freq, 5000,
					\high_pass_mix, 1,
					\high_pass_freq, 20,
					\out, 3,
					\group, ~five_samples_node,
				);
			).play(SystemClock);

			15.wait; //30 secs
			~trumpet_noise_1.set(\gate, 0);

			7.wait; //37 secs

			~trumpet_feedback_2 = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_2][0], \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*660).choose, \loop, 1], target: ~two_samples_node).register;

			~bass_feedback_2 = Synth(\playbuf, [\bufnum, b[\bass_feedback_2][[0, 1, 2, 3].choose], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 5, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*29).choose], target: ~two_samples_node).register;

			3.wait; //40 secs

			~trumpet_feedback_2 .set(\gate, 0);

			~bass_feedback_2.set(\gate, 0);

			~five_sample_stream = Pdef(
				\five_sample_stream,
				Pbind(
					\instrument, \pattern_buf,
					\dur, Pwrand([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 5, 6, 7], (Array.rand(6, 9, 10)++Array.rand(3, 6, 8)).normalizeSum, inf),
					\atk, 0.005,
					\rel, Pwrand([0.005, 0.1, 0.5, 1], [9, 8, 0.5, 0.5].normalizeSum, inf),
					\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
					\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
					//              Seoul             Eric                Nature              Glitch              Piano
					\buf, Pwrand([m[\trumpet_feedback_2][0], m[\trumpet_noise_1][0], m[\bass_feedback_2][(0..3)]], [5, 7, 5].normalizeSum, inf),
					\rate, Pwrand([-10, 10, -8, 8, -6, 6, 4, -4, 2, -2, 1, -1, 0.8, -0.8],  (Array.rand(8, 4, 6)++Array.rand(6, 9, 10)).normalizeSum, inf),
					\spos, Pwhite(0, 36825483),
					\loop, 1,
					\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
					\pan_pos, -1.0,
					\low_pass_mix, 0,
					\low_pass_freq, 5000,
					\high_pass_mix, 1,
					\high_pass_freq, 20,
					\out, 3,
					\group, ~five_samples_node,
				);
			).play(SystemClock);

			21.wait; //1:01 secs

			~trumpet_feedback_2 = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_2][0], \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*660).choose, \loop, 1, \rate, Array.interpolation(30, 0.6, 1.7).choose], target: ~two_samples_node).register;

			~bass_feedback_2 = Synth(\playbuf, [\bufnum, b[\bass_feedback_2][[0, 1, 2, 3].choose], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*29).choose, \rate, Array.interpolation(30, -0.6, -1.7).choose], target: ~two_samples_node).register;

			14.wait; //1:15 secs

			~trumpet_feedback_2.set(\gate, 0);

			~bass_feedback_2.set(\gate, 0);

			19.wait; //1:34

			~trumpet_feedback_2 = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_1][0], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*10).choose, \rate, Array.interpolation(30, -2, -5).choose], target: ~zero_samples_node).register;

			~bass_feedback_2 = Synth(\playbuf, [\bufnum, b[\bass_feedback_1][0], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

			2.wait; //01:36

			~trumpet_feedback_2.set(\gate, 0);
			~bass_feedback_2.set(\gate, 0);

			33.wait; //02:09

			~trumpet_feedback_2 = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_1][0], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3, \c1, \lin, \c2, \lin, \startPos, 0, \rate, 1], target: ~zero_samples_node).register;

			~bass_feedback_2 = Synth(\playbuf, [\bufnum, b[\bass_feedback_1][0], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

			0.5.wait;

			~trumpet_feedback_2.set(\gate, 0);
			~bass_feedback_2.set(\gate, 0);

			0.5.wait;

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);

		}).start(SystemClock);
	},
/*________________________________________________ REPEAT __________________________________________*/

	{~five_samples_routine = Task({ ~clock.set(\reset, 1);


		if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

		//00:00



		~sub = Synth(\playbuf, [\bufnum, b[\sub_1][~sub_1_array.at(~sub_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 10, \rel, 20, \out, 3, \c1, 4, \c2, -8], target: ~five_samples_node).register;

		~trumpet_noise_1 = Synth(\playbuf, [\bufnum, b[\trumpet_noise_1][0], \loop, 0, \gate, 1, \amp, -12, \atk, 0.05, \rel, 60, \out, 4, \c1, 8, \c2, -8], target: ~five_samples_node).register;

		s.sync;

		if(~sub_1_array_index > (~sub_1_array.size - 2), {Routine({~sub_1_array = ~sub_1_array.scramble; s.sync; ~sub_1_array_index=0;}).play(SystemClock)}, {~sub_1_array_index = ~sub_1_array_index + 1});

		15.wait; //15 secs

		~sub.set(\gate, 0);

		~five_sample_stream = Pdef(
			\five_sample_stream,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 5, 6, 7], (Array.rand(6, 9, 10)++Array.rand(3, 6, 8)).normalizeSum, inf),
				\atk, Pwrand([0.005, 0.5, 1], [10, 2, 1].normalizeSum, inf),
				\rel, Pwrand([0.005, 0.1, 0.5, 1], [9, 8, 0.5, 0.5].normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				//              Seoul             Eric                Nature              Glitch              Piano
				\buf, Pwrand([m[\trumpet_feedback_2][0], m[\algo_bank_1][1], m[\bass_feedback_2][(0..3)], m[\algo_bank_1][3], m[\algo_bank_1][4], m[\algo_bank_1][5]], [6, 0, 6, 6, 0, 10].normalizeSum, inf),
				\rate, Pwrand([-10, 10, -8, 8, -6, 6, 4, -4, 2, -2, 1, -1, 0.8, -0.8],  (Array.rand(8, 4, 6)++Array.rand(6, 9, 10)).normalizeSum, inf),
				\spos, Pwhite(0, 36825483),
				\loop, 1,
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
				\pan_pos, -1.0,
				\low_pass_mix, 0,
				\low_pass_freq, 5000,
				\high_pass_mix, 1,
				\high_pass_freq, 20,
				\out, 3,
				\group, ~five_samples_node,
			);
		).play(SystemClock);

		15.wait; //30 secs
		~trumpet_noise_1.set(\gate, 0);

		7.wait; //37 secs

		~trumpet_feedback_2 = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_2][0], \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*660).choose, \loop, 1], target: ~two_samples_node).register;

		~bass_feedback_2 = Synth(\playbuf, [\bufnum, b[\bass_feedback_2][[0, 1, 2, 3].choose], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 5, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*29).choose], target: ~two_samples_node).register;

		3.wait; //40 secs

		~trumpet_feedback_2 .set(\gate, 0);

		~bass_feedback_2.set(\gate, 0);

		~five_sample_stream = Pdef(
			\five_sample_stream,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 5, 6, 7], (Array.rand(6, 9, 10)++Array.rand(3, 6, 8)).normalizeSum, inf),
				\atk, Pwrand([0.005, 0.5, 1], [10, 2, 1].normalizeSum, inf),
				\rel, Pwrand([0.005, 0.1, 0.5, 1], [9, 8, 0.5, 0.5].normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				//              Seoul             Eric                Nature              Glitch              Piano
				\buf, Pwrand([m[\trumpet_feedback_2][0], m[\algo_bank_1][1], m[\bass_feedback_2][(0..3)], m[\algo_bank_1][3], m[\algo_bank_1][4], m[\algo_bank_1][5]], [6, 0, 6, 6, 0, 10].normalizeSum, inf),
				\rate, Pwrand([-10, 10, -8, 8, -6, 6, 4, -4, 2, -2, 1, -1, 0.8, -0.8],  (Array.rand(8, 4, 6)++Array.rand(6, 9, 10)).normalizeSum, inf),
				\spos, Pwhite(0, 36825483),
				\loop, 1,
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
				\pan_pos, -1.0,
				\low_pass_mix, 0,
				\low_pass_freq, 5000,
				\high_pass_mix, 1,
				\high_pass_freq, 20,
				\out, 5,
				\group, ~five_samples_node,
			);
		).play(SystemClock);

		21.wait; //1:01 secs

		~trumpet_feedback_2 = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_2][0], \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*660).choose, \loop, 1, \rate, Array.interpolation(30, 0.6, 1.7).choose], target: ~two_samples_node).register;

		~bass_feedback_2 = Synth(\playbuf, [\bufnum, b[\bass_feedback_2][[0, 1, 2, 3].choose], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*29).choose, \rate, Array.interpolation(30, -0.6, -1.7).choose], target: ~two_samples_node).register;

		14.wait; //1:15 secs

		~trumpet_feedback_2.set(\gate, 0);

		~bass_feedback_2.set(\gate, 0);

		19.wait; //1:34

		~trumpet_feedback_2 = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_1][0], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*10).choose, \rate, Array.interpolation(30, -2, -5).choose], target: ~zero_samples_node).register;

		~bass_feedback_2 = Synth(\playbuf, [\bufnum, b[\bass_feedback_1][0], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

		2.wait; //01:36

		~trumpet_feedback_2.set(\gate, 0);
		~bass_feedback_2.set(\gate, 0);

		33.wait; //02:09

		~trumpet_feedback_2 = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_1][0], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3, \c1, \lin, \c2, \lin, \startPos, 0, \rate, 1], target: ~zero_samples_node).register;

		~bass_feedback_2 = Synth(\playbuf, [\bufnum, b[\bass_feedback_1][0], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

		0.5.wait;

		~trumpet_feedback_2.set(\gate, 0);
		~bass_feedback_2.set(\gate, 0);

		0.5.wait;

		Routine({
			~clock.set(\reset, 0);
			s.sync;
			if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
			if(~index == (~array_size+1), {"piece done".postln});
		}).play(SystemClock);

}).start(SystemClock)});