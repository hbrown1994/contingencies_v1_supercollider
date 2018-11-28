if(~array.at(~index-1) != ~array.at(~index),
	{

		~one_samples_routine = Task({ ~clock.set(\reset, 1);

			thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

			s.sync;
/*________________________________________________ SAMPLE PLAYBACK __________________________________________*/
			~one_sample_stream = Pdef(
				\one_sample_stream,
				Pbind(
					\instrument, \pattern_buf,
					\dur, Pwrand([0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8, 1, 1.5, 2, 2.5, 3, 4, 5, 6], (Array.rand(8, 9, 10)++Array.rand(6, 1, 3)++Array.rand(2, 5, 7)).normalizeSum, inf),
					\atk, Pwrand([0.005, 0.5, 1], [10, 2, 1].normalizeSum, inf),
					\rel, Pwrand([0.005, 0.1, 0.5, 1, 2, 4, 8, 12], [9, 8, 2, 2, 1, 3, 2, 2].normalizeSum, inf),
					\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
					\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
					//              Seoul             Eric                Nature              Glitch              Piano
					\buf, Pwrand([m[\algo_bank_1][0], m[\algo_bank_1][1], m[\algo_bank_1][2], m[\algo_bank_1][3], m[\algo_bank_1][4]], [4, 5, 3, 10, 6].normalizeSum, inf),
					\rate, Pwrand([-10, 10, -8, 8, -6, 6, 4, -4, 0.6, -0.6, 0.4, -0.4, 0.2, -0.2, 0.1, -0.1, 2, -2, 1, -1, 0.8, -0.8],  (Array.rand(8, 4, 6)++Array.rand(8, 1, 3)++Array.rand(6, 9, 10)).normalizeSum, inf),
					\spos,  Pwhite(0, 36825483),
					\loop, 1,
					\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
					\pan_pos, -1.0,
					\low_pass_mix, 0,
					\low_pass_freq, 5000,
					\high_pass_mix, 1,
					\high_pass_freq, 20,
					\out, 3,
					\group, ~one_samples_node,
				);
			).play(SystemClock);

			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

/*________________________________________________ LIVE PROCESSING __________________________________________*/
			~trumpet_fx_1 = Synth(\concat_convolve, [\input, ~trumpet_send, \out, ~trumpet_out, \gate, 1, \bufnum, b[\algo_bank_1][1], \zcr, 0.5, \lms, 0.5, \sc, 1, \st, 0, \matchlength, 0.05], target: ~one_fx_node).register;

			~percussion_fx_1 = Synth(\concat_convolve, [\input, ~percussion_send, \out, ~percussion_out, \gate, 1, \bufnum, b[\algo_bank_1][4], \zcr, 0.5, \lms, 0.5, \sc, 1, \st, 0, \matchlength, 0.05], target: ~one_fx_node).register;


			~bass_sampling_loop_1 = Routine({
				loop
				{

					~bass_fx_1_1 = Synth(\buf_write, [\bufnum, ~bass_buffer_1_1, \input, ~bass_send, \loop, 0], target: ~three_fx_node).register; //00:00

					~one_bass_stream = Pdef( //00:40
						\one_bass_stream,
						Pbind(
							\instrument, \pattern_buf,
							\dur, Pwrand([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(7, 9, 10)).normalizeSum, inf),
							\atk, Pwrand([0.05, 0.3, 0.5, 1], [10, 10, 2, 6].normalizeSum, inf),
							\rel, Pwrand([0.05, 0.3, 0.5, 1], [10, 9, 2, 6].normalizeSum, inf),
							\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
							\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
							\buf,  ~bass_buffer_1_2,
							\rate, Pwrand(Array.series(8, -0.5, -0.1)++Array.series(16, 0.5, 0.1)++Array.series(16, 2, 0.1), (Array.rand(8, 5, 9)++Array.rand(16, 5, 10)++Array.rand(16, 4, 7)).normalizeSum, inf),
							\spos, 0,
							\loop, 1,
							\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
							\pan_pos, -1.0,
							\low_pass_mix, 0,
							\low_pass_freq, 5000,
							\high_pass_mix, 1,
							\high_pass_freq, 20,
							\out, ~bass_out,
							\group, ~three_samples_node,
						);
					).play(SystemClock);

					(~bass_buffer_1_1.numFrames/s.sampleRate).wait;


					~bass_fx_1_2 = Synth(\buf_write, [\bufnum, ~bass_buffer_1_2, \input, ~bass_send, \loop, 0], target: ~three_fx_node).register; //00:00

					~one_bass_stream = Pdef( //00:40
						\one_bass_stream,
						Pbind(
							\instrument, \pattern_buf,
							\dur, Pwrand([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(7, 9, 10)).normalizeSum, inf),
							\atk, Pwrand([0.05, 0.3, 0.5, 1], [10, 10, 2, 6].normalizeSum, inf),
							\rel, Pwrand([0.05, 0.3, 0.5, 1], [10, 9, 2, 6].normalizeSum, inf),
							\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
							\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
							\buf,  ~bass_buffer_1_1,
							\rate, Pwrand(Array.series(8, -0.5, -0.1)++Array.series(16, 0.5, 0.1)++Array.series(16, 2, 0.1), (Array.rand(8, 5, 9)++Array.rand(16, 5, 10)++Array.rand(16, 4, 7)).normalizeSum, inf),
							\spos, 0,
							\loop, 1,
							\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
							\pan_pos, -1.0,
							\low_pass_mix, 0,
							\low_pass_freq, 5000,
							\high_pass_mix, 1,
							\high_pass_freq, 20,
							\out, ~bass_out,
							\group, ~three_samples_node,
						);
					).play(SystemClock);

					(~bass_buffer_1_2.numFrames/s.sampleRate).wait;
				}
			}).play(SystemClock);


			//00:00

			60.wait;

			~one_sample_stream = Pdef(
				\one_sample_stream,
				Pbind(
					\instrument, \pattern_buf,
					\dur, Pwrand([0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8, 1, 1.5, 2, 2.5, 3, 4, 5, 6], (Array.rand(8, 9, 10)++Array.rand(6, 1, 3)++Array.rand(2, 5, 7)).normalizeSum, inf),
					\atk, Pwrand([0.005, 0.5, 1], [10, 2, 1].normalizeSum, inf),
					\rel, Pwrand([0.005, 0.1, 0.5, 1, 2, 4, 8, 12], [9, 8, 2, 2, 1, 3, 2, 2].normalizeSum, inf),
					\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
					\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
					//              Seoul             Eric                Nature              Glitch              Piano
					\buf, Pwrand([m[\algo_bank_1][0], m[\algo_bank_1][1], m[\algo_bank_1][2], m[\algo_bank_1][3], m[\algo_bank_1][4], ~real_time_buffer], [4, 5, 3, 10, 6, 9].normalizeSum, inf),
					\rate, Pwrand([-10, 10, -8, 8, -6, 6, 4, -4, 0.6, -0.6, 0.4, -0.4, 0.2, -0.2, 0.1, -0.1, 2, -2, 1, -1, 0.8, -0.8],  (Array.rand(8, 4, 6)++Array.rand(8, 1, 3)++Array.rand(6, 9, 10)).normalizeSum, inf),
					\spos, Pif(\buf==~real_time_buffer, Pwhite(0, s.sampleRate*10), Pwhite(0, 36825483)),
					\loop, 1,
					\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
					\pan_pos, -1.0,
					\low_pass_mix, 0,
					\low_pass_freq, 5000,
					\high_pass_mix, 1,
					\high_pass_freq, 20,
					\out, 5,
					\group, ~one_samples_node,
				);
			).play(SystemClock);

			53.wait;

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);

		}).start(SystemClock);
	},
/*________________________________________________ REPEAT __________________________________________*/
	{~one_samples_routine = Task({ ~clock.set(\reset, 1);



		113.wait;

		Routine({
			~clock.set(\reset, 0);
			s.sync;
			if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
			if(~index == (~array_size+1), {"piece done".postln});
		}).play(SystemClock);


	}).start(SystemClock);
});
