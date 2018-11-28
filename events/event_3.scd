/*________________________________________________ LIVE PROCESSING __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{

		~three_fx_routine = Task({

			thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

			s.sync;

			~percussion_sampling_loop_3 = Routine({
				loop
				{

					~percussion_fx_3_1 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_1, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

					~three_percussion_stream = Pdef( //00:00 & 00:40
						\three_percussion_stream,
						Pbind(
							\instrument, \pattern_buf,
							\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
							\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
							\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
							\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
							\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
							//              Seoul             Eric                Nature              Glitch              Piano
							\buf,  ~percussion_buffer_3_2,
							\rate, -1,
							\spos, 0,
							\loop, 1,
							\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
							\pan_pos, -1.0,
							\low_pass_mix, 0,
							\low_pass_freq, 5000,
							\high_pass_mix, 1,
							\high_pass_freq, 20,
							\out, ~percussion_out,
							\group, ~three_samples_node,
						);
					).play(SystemClock);

					(~percussion_buffer_3_1.numFrames/s.sampleRate).wait;


					~percussion_fx_3_2 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_2, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

					~three_percussion_stream = Pdef( //00:00 & 00:40
						\three_percussion_stream,
						Pbind(
							\instrument, \pattern_buf,
							\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
							\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
							\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
							\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
							\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
							//              Seoul             Eric                Nature              Glitch              Piano
							\buf,  ~percussion_buffer_3_1,
							\rate, -1,
							\spos, 0,
							\loop, 1,
							\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
							\pan_pos, -1.0,
							\low_pass_mix, 0,
							\low_pass_freq, 5000,
							\high_pass_mix, 1,
							\high_pass_freq, 20,
							\out, ~percussion_out,
							\group, ~three_samples_node,
						);
					).play(SystemClock);


					(~percussion_buffer_3_2.numFrames/s.sampleRate).wait;
				}
			}).play(SystemClock);


			15.wait; //00:15

			~three_percussion_stream.stop;
			~percussion_sampling_loop_3.stop;
			~trumpet_fx_3 = Synth(\ntube_4, [\amp, -12, \speed, 100, \in, ~trumpet_send, \out, ~trumpet_out, \rel, 0.01, \atk, 5],target: ~nine_fx_node).register; //00:00
			~percussion_fx_3 = Synth(\ntube_5, [\amp, -12, \speed, 100, \in, ~percussion_send, \out, ~percussion_out, \rel, 0.01, \atk, 5],target: ~nine_fx_node).register; //00:00

			25.wait; //00:40

			~percussion_fx_3.set(\gate, 0);

			~percussion_sampling_loop_3 = Routine({
				loop
				{

					~percussion_fx_3_1 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_1, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

					~three_percussion_stream = Pdef( //00:00 & 00:40
						\three_percussion_stream,
						Pbind(
							\instrument, \pattern_buf,
							\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
							\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
							\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
							\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
							\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
							//              Seoul             Eric                Nature              Glitch              Piano
							\buf,  ~percussion_buffer_3_2,
							\rate, -1,
							\spos, 0,
							\loop, 1,
							\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
							\pan_pos, -1.0,
							\low_pass_mix, 0,
							\low_pass_freq, 5000,
							\high_pass_mix, 1,
							\high_pass_freq, 20,
							\out, ~percussion_out,
							\group, ~three_samples_node,
						);
					).play(SystemClock);

					(~percussion_buffer_3_1.numFrames/s.sampleRate).wait;


					~percussion_fx_3_2 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_2, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

					~three_percussion_stream = Pdef( //00:00 & 00:40
						\three_percussion_stream,
						Pbind(
							\instrument, \pattern_buf,
							\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
							\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
							\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
							\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
							\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
							//              Seoul             Eric                Nature              Glitch              Piano
							\buf,  ~percussion_buffer_3_1,
							\rate, -1,
							\spos, 0,
							\loop, 1,
							\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
							\pan_pos, -1.0,
							\low_pass_mix, 0,
							\low_pass_freq, 5000,
							\high_pass_mix, 1,
							\high_pass_freq, 20,
							\out, ~percussion_out,
							\group, ~three_samples_node,
						);
					).play(SystemClock);


					(~percussion_buffer_3_2.numFrames/s.sampleRate).wait;
				}
			}).play(SystemClock);



			~bass_sampling_loop_3 = Routine({
				~bass_fx_3_3 = Synth(\ntube_6, [\out, ~bass_out, \in, ~bass_send, \ntube_input, ~ntube_send], target: ~three_fx_node).register; //00:00
				loop
				{

					~bass_fx_3_1 = Synth(\buf_write, [\bufnum, ~bass_buffer_3_1, \input, ~bass_send, \loop, 0], target: ~two_fx_node).register; //00:00

					~three_bass_stream = Pdef( //00:40
						\three_bass_stream,
						Pbind(
							\instrument, \pattern_buf,
							\dur, Pwrand([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(7, 9, 10)).normalizeSum, inf),
							\atk, 0.05,
							\rel, Pwhite(0.05, 1.5),
							\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
							\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
							\buf,  ~bass_buffer_3_2,
							\rate, Pwrand(Array.series(8, -0.5, -0.1)++Array.series(16, 0.5, 0.1)++Array.series(16, 2, 0.1), (Array.rand(8, 5, 9)++Array.rand(16, 5, 10)++Array.rand(16, 4, 7)).normalizeSum, inf),
							\spos, 0,
							\loop, 1,
							\amp, 0,
							\pan_pos, -1.0,
							\low_pass_mix, 0,
							\low_pass_freq, 5000,
							\high_pass_mix, 1,
							\high_pass_freq, 20,
							\out, ~ntube_send,
							\group, ~two_fx_node,
						);
					).play(SystemClock);

					(~bass_buffer_3_1.numFrames/s.sampleRate).wait;


					~bass_fx_3_2 = Synth(\buf_write, [\bufnum, ~bass_buffer_3_2, \input, ~bass_send, \loop, 0], target: ~two_fx_node).register; //00:00

					~three_bass_stream = Pdef( //00:40
						\three_bass_stream,
						Pbind(
							\instrument, \pattern_buf,
							\dur, Pwrand([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(7, 9, 10)).normalizeSum, inf),
							\atk, 0.05,
							\rel, Pwhite(0.05, 1.5),
							\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
							\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
							\buf,  ~bass_buffer_3_1,
							\rate, Pwrand(Array.series(8, -0.5, -0.1)++Array.series(16, 0.5, 0.1)++Array.series(16, 2, 0.1), (Array.rand(8, 5, 9)++Array.rand(16, 5, 10)++Array.rand(16, 4, 7)).normalizeSum, inf),
							\spos, 0,
							\loop, 1,
							\amp, 0,
							\pan_pos, -1.0,
							\low_pass_mix, 0,
							\low_pass_freq, 5000,
							\high_pass_mix, 1,
							\high_pass_freq, 20,
							\out, ~ntube_send,
							\group, ~two_fx_node,
						);
					).play(SystemClock);
					(~bass_buffer_3_2.numFrames/s.sampleRate).wait;
				}
			}).play(SystemClock);


			10.wait; //00:50
			~three_percussion_stream.stop;
			~percussion_sampling_loop_3.stop;
			~percussion_fx_3 = Synth(\ntube_5, [\amp, -12, \speed, 100, \in, ~percussion_send, \out, ~percussion_out, \rel, 0.01, \atk, 5],target: ~nine_fx_node).register; //00:00

			20.wait; //01:10

			~percussion_fx_3.set(\gate, 0);
			~trumpet_fx_3.set(\gate, 0);
			~trumpet_fx_3_1 = Synth(\ntube_9, [\amp, -12, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~trumpet_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~trumpet_out, \amp_input_bus,~trumpet_rms_send, \amp_input_bus_trig, ~trumpet_peak_trig_send], target: ~nine_fx_node).register;

			~percussion_sampling_loop_3 = Routine({
				loop
				{

					~percussion_fx_3_1 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_1, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

					~three_percussion_stream = Pdef( //00:00 & 00:40
						\three_percussion_stream,
						Pbind(
							\instrument, \pattern_buf,
							\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
							\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
							\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
							\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
							\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
							//              Seoul             Eric                Nature              Glitch              Piano
							\buf,  ~percussion_buffer_3_2,
							\rate, -1,
							\spos, 0,
							\loop, 1,
							\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
							\pan_pos, -1.0,
							\low_pass_mix, 0,
							\low_pass_freq, 5000,
							\high_pass_mix, 1,
							\high_pass_freq, 20,
							\out, ~percussion_out,
							\group, ~three_samples_node,
						);
					).play(SystemClock);

					(~percussion_buffer_3_1.numFrames/s.sampleRate).wait;


					~percussion_fx_3_2 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_2, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

					~three_percussion_stream = Pdef( //00:00 & 00:40
						\three_percussion_stream,
						Pbind(
							\instrument, \pattern_buf,
							\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
							\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
							\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
							\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
							\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
							//              Seoul             Eric                Nature              Glitch              Piano
							\buf,  ~percussion_buffer_3_1,
							\rate, -1,
							\spos, 0,
							\loop, 1,
							\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
							\pan_pos, -1.0,
							\low_pass_mix, 0,
							\low_pass_freq, 5000,
							\high_pass_mix, 1,
							\high_pass_freq, 20,
							\out, ~percussion_out,
							\group, ~three_samples_node,
						);
					).play(SystemClock);


					(~percussion_buffer_3_2.numFrames/s.sampleRate).wait;
				}
			}).play(SystemClock);

			20.wait; //01:30

			~bass_fx_3_4 = Synth(\fric, [\input, ~bass_send, \out, ~bass_out, \amp_in, ~bass_peak_trig_send, \gate, 1, \rel, 0.05], target: ~one_fx_node).register;


			19.wait;

			~trumpet_fx_3 = Synth(\ntube_4, [\amp, -12, \speed, 100, \in, ~trumpet_send, \out, ~trumpet_out, \rel, 0.01, \atk, 5],target: ~nine_fx_node).register; //00:00
			~bass_fx_3_4.set(\gate, 0);
			~three_percussion_stream.stop;
			~percussion_sampling_loop_3.stop;



		}).start(SystemClock);

	},
/*________________________________________________ REPEAT __________________________________________*/

	{ ~three_fx_routine = Task({

		if(~trumpet_fx_3.isPlaying, {~trumpet_fx_3.set(\gate, 0)}, {nil});
		if(~bass_fx_3_1.isPlaying, {~bass_fx_3_1.set(\gate, 0)}, {nil});
		if(~three_percussion_stream.isPlaying, {~three_percussion_stream.stop}, {nil});
		if(~percussion_sampling_loop_3.isPlaying, {~percussion_sampling_loop_3.stop}, {nil});

		s.sync;

		~percussion_sampling_loop_3 = Routine({
			loop
			{

				~percussion_fx_3_1 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_1, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

				~three_percussion_stream = Pdef( //00:00 & 00:40
					\three_percussion_stream,
					Pbind(
						\instrument, \pattern_buf,
						\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
						\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
						\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
						\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
						\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
						//              Seoul             Eric                Nature              Glitch              Piano
						\buf,  ~percussion_buffer_3_2,
						\rate, -1,
						\spos, 0,
						\loop, 1,
						\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
						\pan_pos, -1.0,
						\low_pass_mix, 0,
						\low_pass_freq, 5000,
						\high_pass_mix, 1,
						\high_pass_freq, 20,
						\out, ~percussion_out,
						\group, ~three_samples_node,
					);
				).play(SystemClock);

				(~percussion_buffer_3_1.numFrames/s.sampleRate).wait;


				~percussion_fx_3_2 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_2, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

				~three_percussion_stream = Pdef( //00:00 & 00:40
					\three_percussion_stream,
					Pbind(
						\instrument, \pattern_buf,
						\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
						\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
						\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
						\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
						\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
						//              Seoul             Eric                Nature              Glitch              Piano
						\buf,  ~percussion_buffer_3_1,
						\rate, -1,
						\spos, 0,
						\loop, 1,
						\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
						\pan_pos, -1.0,
						\low_pass_mix, 0,
						\low_pass_freq, 5000,
						\high_pass_mix, 1,
						\high_pass_freq, 20,
						\out, ~percussion_out,
						\group, ~three_samples_node,
					);
				).play(SystemClock);


				(~percussion_buffer_3_2.numFrames/s.sampleRate).wait;
			}
		}).play(SystemClock);


		15.wait; //00:15

		~three_percussion_stream.stop;
		~percussion_sampling_loop_3.stop;
		~trumpet_fx_3 = Synth(\ntube_4, [\amp, -12, \speed, 100, \in, ~trumpet_send, \out, ~trumpet_out, \rel, 0.01, \atk, 5],target: ~nine_fx_node).register; //00:00
		~percussion_fx_3 = Synth(\ntube_5, [\amp, -12, \speed, 100, \in, ~percussion_send, \out, ~percussion_out, \rel, 0.01, \atk, 5],target: ~nine_fx_node).register; //00:00

		25.wait; //00:40

		~percussion_fx_3.set(\gate, 0);

		~percussion_sampling_loop_3 = Routine({
			loop
			{

				~percussion_fx_3_1 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_1, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

				~three_percussion_stream = Pdef( //00:00 & 00:40
					\three_percussion_stream,
					Pbind(
						\instrument, \pattern_buf,
						\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
						\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
						\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
						\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
						\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
						//              Seoul             Eric                Nature              Glitch              Piano
						\buf,  ~percussion_buffer_3_2,
						\rate, -1,
						\spos, 0,
						\loop, 1,
						\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
						\pan_pos, -1.0,
						\low_pass_mix, 0,
						\low_pass_freq, 5000,
						\high_pass_mix, 1,
						\high_pass_freq, 20,
						\out, ~percussion_out,
						\group, ~three_samples_node,
					);
				).play(SystemClock);

				(~percussion_buffer_3_1.numFrames/s.sampleRate).wait;


				~percussion_fx_3_2 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_2, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

				~three_percussion_stream = Pdef( //00:00 & 00:40
					\three_percussion_stream,
					Pbind(
						\instrument, \pattern_buf,
						\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
						\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
						\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
						\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
						\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
						//              Seoul             Eric                Nature              Glitch              Piano
						\buf,  ~percussion_buffer_3_1,
						\rate, -1,
						\spos, 0,
						\loop, 1,
						\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
						\pan_pos, -1.0,
						\low_pass_mix, 0,
						\low_pass_freq, 5000,
						\high_pass_mix, 1,
						\high_pass_freq, 20,
						\out, ~percussion_out,
						\group, ~three_samples_node,
					);
				).play(SystemClock);


				(~percussion_buffer_3_2.numFrames/s.sampleRate).wait;
			}
		}).play(SystemClock);



		~bass_sampling_loop_3 = Routine({
			~bass_fx_3_3 = Synth(\ntube_6, [\out, ~bass_out, \in, ~bass_send, \ntube_input, ~ntube_send], target: ~three_fx_node).register; //00:00
			loop
			{

				~bass_fx_3_1 = Synth(\buf_write, [\bufnum, ~bass_buffer_3_1, \input, ~bass_send, \loop, 0], target: ~two_fx_node).register; //00:00

				~three_bass_stream = Pdef( //00:40
					\three_bass_stream,
					Pbind(
						\instrument, \pattern_buf,
						\dur, Pwrand([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(7, 9, 10)).normalizeSum, inf),
						\atk, 0.05,
						\rel, Pwhite(0.05, 1.5),
						\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
						\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
						\buf,  ~bass_buffer_3_2,
						\rate, Pwrand(Array.series(8, -0.5, -0.1)++Array.series(16, 0.5, 0.1)++Array.series(16, 2, 0.1), (Array.rand(8, 5, 9)++Array.rand(16, 5, 10)++Array.rand(16, 4, 7)).normalizeSum, inf),
						\spos, 0,
						\loop, 1,
						\amp, 0,
						\pan_pos, -1.0,
						\low_pass_mix, 0,
						\low_pass_freq, 5000,
						\high_pass_mix, 1,
						\high_pass_freq, 20,
						\out, ~ntube_send,
						\group, ~two_fx_node,
					);
				).play(SystemClock);

				(~bass_buffer_3_1.numFrames/s.sampleRate).wait;


				~bass_fx_3_2 = Synth(\buf_write, [\bufnum, ~bass_buffer_3_2, \input, ~bass_send, \loop, 0], target: ~two_fx_node).register; //00:00

				~three_bass_stream = Pdef( //00:40
					\three_bass_stream,
					Pbind(
						\instrument, \pattern_buf,
						\dur, Pwrand([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(7, 9, 10)).normalizeSum, inf),
						\atk, 0.05,
						\rel, Pwhite(0.05, 1.5),
						\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
						\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
						\buf,  ~bass_buffer_3_1,
						\rate, Pwrand(Array.series(8, -0.5, -0.1)++Array.series(16, 0.5, 0.1)++Array.series(16, 2, 0.1), (Array.rand(8, 5, 9)++Array.rand(16, 5, 10)++Array.rand(16, 4, 7)).normalizeSum, inf),
						\spos, 0,
						\loop, 1,
						\amp, 0,
						\pan_pos, -1.0,
						\low_pass_mix, 0,
						\low_pass_freq, 5000,
						\high_pass_mix, 1,
						\high_pass_freq, 20,
						\out, ~ntube_send,
						\group, ~two_fx_node,
					);
				).play(SystemClock);
				(~bass_buffer_3_2.numFrames/s.sampleRate).wait;
			}
		}).play(SystemClock);


		10.wait; //00:50
		~three_percussion_stream.stop;
		~percussion_sampling_loop_3.stop;
		~percussion_fx_3 = Synth(\ntube_5, [\amp, -12, \speed, 100, \in, ~percussion_send, \out, ~percussion_out, \rel, 0.01, \atk, 5],target: ~nine_fx_node).register; //00:00

		20.wait; //01:10

		~percussion_fx_3.set(\gate, 0);
		~trumpet_fx_3.set(\gate, 0);
		~trumpet_fx_3_1 = Synth(\ntube_9, [\amp, -12, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~trumpet_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~trumpet_out, \amp_input_bus,~trumpet_rms_send, \amp_input_bus_trig, ~trumpet_peak_trig_send], target: ~nine_fx_node).register;

		~percussion_sampling_loop_3 = Routine({
			loop
			{

				~percussion_fx_3_1 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_1, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

				~three_percussion_stream = Pdef( //00:00 & 00:40
					\three_percussion_stream,
					Pbind(
						\instrument, \pattern_buf,
						\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
						\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
						\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
						\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
						\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
						//              Seoul             Eric                Nature              Glitch              Piano
						\buf,  ~percussion_buffer_3_2,
						\rate, -1,
						\spos, 0,
						\loop, 1,
						\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
						\pan_pos, -1.0,
						\low_pass_mix, 0,
						\low_pass_freq, 5000,
						\high_pass_mix, 1,
						\high_pass_freq, 20,
						\out, ~percussion_out,
						\group, ~three_samples_node,
					);
				).play(SystemClock);

				(~percussion_buffer_3_1.numFrames/s.sampleRate).wait;


				~percussion_fx_3_2 = Synth(\buf_write, [\bufnum, ~percussion_buffer_3_2, \input, ~percussion_send], target: ~two_fx_node).register; //00:00

				~three_percussion_stream = Pdef( //00:00 & 00:40
					\three_percussion_stream,
					Pbind(
						\instrument, \pattern_buf,
						\dur, Pwrand([0.2, 0.3, 0.4, 0.5, 0.6, 0.8], (Array.rand(6, 9, 10)).normalizeSum, inf),
						\atk, Pwrand([0.01, 0.5], [10, 7].normalizeSum, inf),
						\rel, Pwrand([0.01, 0.1, 0.5, 1.49], [9, 8, 2, 6].normalizeSum, inf),
						\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
						\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
						//              Seoul             Eric                Nature              Glitch              Piano
						\buf,  ~percussion_buffer_3_1,
						\rate, -1,
						\spos, 0,
						\loop, 1,
						\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
						\pan_pos, -1.0,
						\low_pass_mix, 0,
						\low_pass_freq, 5000,
						\high_pass_mix, 1,
						\high_pass_freq, 20,
						\out, ~percussion_out,
						\group, ~three_samples_node,
					);
				).play(SystemClock);


				(~percussion_buffer_3_2.numFrames/s.sampleRate).wait;
			}
		}).play(SystemClock);

		20.wait; //01:30

		~bass_fx_3_4 = Synth(\fric, [\input, ~bass_send, \out, ~bass_out, \amp_in, ~bass_peak_trig_send, \gate, 1, \rel, 0.05], target: ~one_fx_node).register;


		19.wait;

		~trumpet_fx_3 = Synth(\ntube_4, [\amp, -12, \speed, 100, \in, ~trumpet_send, \out, ~trumpet_out, \rel, 0.01, \atk, 5],target: ~nine_fx_node).register; //00:00
		~bass_fx_3_4.set(\gate, 0);
		~three_percussion_stream.stop;
		~percussion_sampling_loop_3.stop;



}).start(SystemClock)});

/*________________________________________________ SAMPLE PLAYBACK __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{

		if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});
		~three_samples_routine = Task({ ~clock.set(\reset, 1);


			//00:00

			~glitch_1 = Synth(\playbuf, [\bufnum, b[\three_glitch_1][~three_glitch_1_array.at(~three_glitch_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3, \c1, 8, \c2, -8], target: ~three_samples_node).register;

			s.sync;

			if(~three_glitch_1_array_index > (~three_glitch_1_array.size - 2), {Routine({~three_glitch_1_array = ~three_glitch_1_array.scramble; s.sync; ~three_glitch_1_array_index=0;}).play(SystemClock)}, {~three_glitch_1_array_index = ~three_glitch_1_array_index + 1});

			20.wait; //00:20

			~glitch_1.set(\gate, 0);

			4.wait; //00:24

			~asmr_1 = Synth(\playbuf, [\bufnum, b[\three_asmr_1][~three_asmr_1_array.at(~three_asmr_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3], target: ~three_samples_node).register;

			s.sync;

			if(~three_asmr_1_array_index > (~three_asmr_1_array.size - 2), {Routine({~three_asmr_1_array = ~three_asmr_1_array.scramble; s.sync; ~three_asmr_1_array_index=0;}).play(SystemClock)}, {~three_asmr_1_array_index = ~three_asmr_1_array_index + 1});

			16.wait; //00:40

			~asmr_1.set(\gate, 0);

			21.wait; //01:01

			~glitch_1 = Synth(\playbuf, [\bufnum, b[\three_glitch_1][~three_glitch_1_array.at(~three_glitch_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3], target: ~three_samples_node).register;

			s.sync;

			if(~three_glitch_1_array_index > (~three_glitch_1_array.size - 2), {Routine({~three_glitch_1_array = ~three_glitch_1_array.scramble; s.sync; ~three_glitch_1_array_index=0;}).play(SystemClock)}, {~three_glitch_1_array_index = ~three_glitch_1_array_index + 1});

			1.wait; //01:02

			~glitch_1.set(\gate, 0);

			10.wait; //01:12

			~glitch_1 = Synth(\playbuf, [\bufnum, b[\three_glitch_1][~three_glitch_1_array.at(~three_glitch_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3], target: ~three_samples_node).register;

			s.sync;

			if(~three_glitch_1_array_index > (~three_glitch_1_array.size - 2), {Routine({~three_glitch_1_array = ~three_glitch_1_array.scramble; s.sync; ~three_glitch_1_array_index=0;}).play(SystemClock)}, {~three_glitch_1_array_index = ~three_glitch_1_array_index + 1});

			6.wait; //01:18

			~glitch_1.set(\gate, 0);

			16.wait; //01:34

			~noise_1 = Synth(\playbuf, [\bufnum, b[\three_noise_1][~three_noise_1_array.at(~three_noise_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 5], target: ~three_samples_node).register;

			s.sync;

			if(~three_noise_1_array_index > (~three_noise_1_array.size - 2), {Routine({~three_noise_1_array = ~three_noise_1_array.scramble; s.sync; ~three_noise_1_array_index=0;}).play(SystemClock)}, {~three_noise_1_array_index = ~three_noise_1_array_index + 1});

			4.wait; //01:39

			~glitch_1 = Synth(\playbuf, [\bufnum, b[\three_glitch_1][~three_glitch_1_array.at(~three_glitch_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 1, \rel, 0.005, \out, 4], target: ~three_samples_node).register;

			s.sync;

			if(~three_glitch_1_array_index > (~three_glitch_1_array.size - 2), {Routine({~three_glitch_1_array = ~three_glitch_1_array.scramble; s.sync; ~three_glitch_1_array_index=0;}).play(SystemClock)}, {~three_glitch_1_array_index = ~three_glitch_1_array_index + 1});

			~drums_1 = Synth(\playbuf, [\bufnum, b[\drums_1][~drums_1_array.at(~drums_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3], target: ~three_samples_node).register;

			s.sync;

			if(~drums_1_array_index > (~drums_1_array.size - 2), {Routine({~drums_1_array = ~drums_1_array.scramble; s.sync; ~drums_1_array_index=0;}).play(SystemClock)}, {~drums_1_array_index = ~drums_1_array_index + 1});

			10.wait; //01:49

			~glitch_1.set(\gate, 0);
			~noise_1.set(\gate, 0);
			~drums_1.set(\gate, 0);

			s.sync;

			~high_sine_1 = Synth(\playbuf, [\bufnum, b[\three_high_sine_1][~three_high_sine_1_array.at(~three_high_sine_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 1, \rel, 30, \out, 5, \c1, 8, \c2, -8], target: ~three_samples_node).register;

			s.sync;

			if(~three_high_sine_1_array_index > (~three_high_sine_1_array.size - 2), {Routine({~three_high_sine_1_array = ~three_high_sine_1_array.scramble; s.sync; ~three_high_sine_1_array_index=0;}).play(SystemClock)}, {~three_high_sine_1_array_index = ~three_high_sine_1_array_index + 1});

			15.wait; //01:39

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);

		}).start(SystemClock);
	},

/*________________________________________________ REPEAT __________________________________________*/

	{
		~high_sine_1.set(\gate, 0);
		if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});
		~three_samples_routine = Task({ ~clock.set(\reset, 1);


			//00:00

			~glitch_1 = Synth(\playbuf, [\bufnum, b[\three_glitch_1][~three_glitch_1_array.at(~three_glitch_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3, \c1, 8, \c2, -8], target: ~three_samples_node).register;

			s.sync;

			if(~three_glitch_1_array_index > (~three_glitch_1_array.size - 2), {Routine({~three_glitch_1_array = ~three_glitch_1_array.scramble; s.sync; ~three_glitch_1_array_index=0;}).play(SystemClock)}, {~three_glitch_1_array_index = ~three_glitch_1_array_index + 1});

			20.wait; //00:20

			~glitch_1.set(\gate, 0);

			4.wait; //00:24

			~asmr_1 = Synth(\playbuf, [\bufnum, b[\three_asmr_1][~three_asmr_1_array.at(~three_asmr_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3], target: ~three_samples_node).register;

			s.sync;

			if(~three_asmr_1_array_index > (~three_asmr_1_array.size - 2), {Routine({~three_asmr_1_array = ~three_asmr_1_array.scramble; s.sync; ~three_asmr_1_array_index=0;}).play(SystemClock)}, {~three_asmr_1_array_index = ~three_asmr_1_array_index + 1});

			16.wait; //00:40

			~asmr_1.set(\gate, 0);

			21.wait; //01:01

			~glitch_1 = Synth(\playbuf, [\bufnum, b[\three_glitch_1][~three_glitch_1_array.at(~three_glitch_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3], target: ~three_samples_node).register;

			s.sync;

			if(~three_glitch_1_array_index > (~three_glitch_1_array.size - 2), {Routine({~three_glitch_1_array = ~three_glitch_1_array.scramble; s.sync; ~three_glitch_1_array_index=0;}).play(SystemClock)}, {~three_glitch_1_array_index = ~three_glitch_1_array_index + 1});

			1.wait; //01:02

			~glitch_1.set(\gate, 0);

			10.wait; //01:12

			~glitch_1 = Synth(\playbuf, [\bufnum, b[\three_glitch_1][~three_glitch_1_array.at(~three_glitch_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3], target: ~three_samples_node).register;

			s.sync;

			if(~three_glitch_1_array_index > (~three_glitch_1_array.size - 2), {Routine({~three_glitch_1_array = ~three_glitch_1_array.scramble; s.sync; ~three_glitch_1_array_index=0;}).play(SystemClock)}, {~three_glitch_1_array_index = ~three_glitch_1_array_index + 1});

			6.wait; //01:18

			~glitch_1.set(\gate, 0);

			16.wait; //01:34

			~noise_1 = Synth(\playbuf, [\bufnum, b[\three_noise_1][~three_noise_1_array.at(~three_noise_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 5], target: ~three_samples_node).register;

			s.sync;

			if(~three_noise_1_array_index > (~three_noise_1_array.size - 2), {Routine({~three_noise_1_array = ~three_noise_1_array.scramble; s.sync; ~three_noise_1_array_index=0;}).play(SystemClock)}, {~three_noise_1_array_index = ~three_noise_1_array_index + 1});

			4.wait; //01:39

			~glitch_1 = Synth(\playbuf, [\bufnum, b[\three_glitch_1][~three_glitch_1_array.at(~three_glitch_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 1, \rel, 0.005, \out, 4], target: ~three_samples_node).register;

			s.sync;

			if(~three_glitch_1_array_index > (~three_glitch_1_array.size - 2), {Routine({~three_glitch_1_array = ~three_glitch_1_array.scramble; s.sync; ~three_glitch_1_array_index=0;}).play(SystemClock)}, {~three_glitch_1_array_index = ~three_glitch_1_array_index + 1});

			~drums_1 = Synth(\playbuf, [\bufnum, b[\drums_1][~drums_1_array.at(~drums_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3], target: ~three_samples_node).register;

			s.sync;

			if(~drums_1_array_index > (~drums_1_array.size - 2), {Routine({~drums_1_array = ~drums_1_array.scramble; s.sync; ~drums_1_array_index=0;}).play(SystemClock)}, {~drums_1_array_index = ~drums_1_array_index + 1});

			10.wait; //01:49

			~glitch_1.set(\gate, 0);
			~noise_1.set(\gate, 0);
			~drums_1.set(\gate, 0);

			s.sync;

			~high_sine_1 = Synth(\playbuf, [\bufnum, b[\three_high_sine_1][~three_high_sine_1_array.at(~three_high_sine_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 1, \rel, 30, \out, 5, \c1, 8, \c2, -8], target: ~three_samples_node).register;

			s.sync;

			if(~three_high_sine_1_array_index > (~three_high_sine_1_array.size - 2), {Routine({~three_high_sine_1_array = ~three_high_sine_1_array.scramble; s.sync; ~three_high_sine_1_array_index=0;}).play(SystemClock)}, {~three_high_sine_1_array_index = ~three_high_sine_1_array_index + 1});

			15.wait; //01:39

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);

		}).start(SystemClock);

});