
/*________________________________________________ LIVE PROCESSING __________________________________________*/
if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

~zero_fx_routine = Task({

	thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

	s.sync;

	//00:00
	~trumpet_fx_0_1 = Synth(\wild_delay_1, [\bufnum, ~short_delay_buffer_3, \input, ~trumpet_send, \out, ~trumpet_out, \thresh, ~trumpet_onset_thesh_init, \rel, 0.05, \amp, -12], target: ~nine_fx_node).register;
	~percussion_fx_0_1 = Synth(\wild_delay_1, [\bufnum, ~short_delay_buffer_1, \input, ~percussion_send, \out, ~percussion_out, \thresh, ~percussion_onset_thesh_init, \rel, 0.05, \amp, -12], target: ~nine_fx_node).register;
	~bass_fx_0_1 = Synth(\pulse_delay, [\input, ~bass_send, \out, ~bass_out, \amp_input, ~bass_peak_trig_send, \thresh, ~bass_onset_thesh_init, \pitch_low, 0.9, \pitch_hi, 1.9, \rel, 11, \amp, -12], target: ~four_fx_node).register;

	35.wait; //00:35
	~trumpet_fx_0_1.set(\gate, 0, \rel, 0.05);
	~bass_fx_0_1.set(\gate, 0, \rel, 0.05);
	~percussion_fx_0_1.set(\gate, 0, \rel, 0.05);

	5.wait; //00:40
	~bass_fx_0_2 = Synth(\wild_delay_1, [\amp, -12, \bufnum, ~short_delay_buffer_2, \input, ~bass_send, \out, ~bass_out, \thresh, ~bass_onset_thesh_init], target: ~nine_fx_node).register;
	~trumpet_fx_0_2 = Synth(\fric, [\amp, -12, \input, ~trumpet_send, \out, ~trumpet_out, \grain_speed, 10, \grain_dur, 0.1, \amp_in, ~trumpet_peak_trig_send, \rel, 0.05], target: ~one_fx_node).register; //01:31
	~percussion_fx_0_2 = Synth(\pulse_delay, [\input, ~percussion_send, \out, ~percussion_out, \amp_input, ~percussion_peak_trig_send, \thresh, ~percussion_onset_thesh_init, \pitch_low, 0.5, \pitch_hi, 1.0, \rel, 11, \delay_low, 0.9, \delay_hi, 1, \delay_factor, 0.8, \rel, 20, \amp, -12], target: ~four_fx_node).register;

	4.wait; //00:44
	~percussion_fx_0_2.set(\gate, 0);
	~trumpet_fx_0_2.set(\gate, 0);

	5.wait; //00:49

	~bass_fx_0_2.set(\gate, 0, \rel, 0.05);


	6.wait; //00:55
	~input_sum_0 = Synth(\input_sum, [\gate, 1], target: ~input_sum).register;
	~greyhole_0 = Synth(\greyhole_1, [\amp, -12, \gate, 1, \atk, 2, \rel, 0.05, \in, ~input_sum_send , \out, ~trumpet_out], target: ~eight_fx_node).register;

	20.wait; //01:15

	~input_sum_0.set(\gate, 0);
	~greyhole_0.set(\gate, 0);
	~bass_fx_0_2 = Synth(\bass_pitch, [\gate, 1,  \amp, -12, \input, ~bass_send, \amp_input, ~bass_peak_trig_send, \out, ~bass_out], target: ~two_fx_node).register;
	~trumpet_fx_0_2 = Synth(\fric, [\amp, -12, \input, ~trumpet_send, \out, ~trumpet_out, \grain_speed, 10, \grain_dur, 0.1, \amp_in, ~trumpet_peak_trig_send, \rel, 0.05], target: ~one_fx_node).register; //01:31
	~percussion_fx_0_2 = Synth(\pulse_delay, [\amp, -12,\input, ~percussion_send, \out, ~percussion_out, \amp_input, ~percussion_peak_trig_send, \thresh, ~percussion_onset_thesh_init, \pitch_low, 0.5, \pitch_hi, 1.0, \rel, 11, \delay_low, 0.9, \delay_hi, 1, \delay_factor, 0.8, \rel, 20], target: ~four_fx_node).register;

	4.wait; //01:19
	~bass_fx_0_2.set(\gate, 0, \rel, 0.05);
	~trumpet_fx_0_2.set(\gate, 0, \rel, 0.05);
	~percussion_fx_0_2.set(\gate, 0, \rel, 0.05);

	7.wait; //01:26

	~trumpet_fx_0_1 = Synth(\wild_delay_1, [\amp, -12,\bufnum, ~short_delay_buffer_3, \input, ~trumpet_send, \out, ~trumpet_out, \thresh, ~trumpet_onset_thesh_init, \rel, 0.05], target: ~nine_fx_node).register;
	~percussion_fx_0_1 = Synth(\wild_delay_1, [\amp, -12, \bufnum, ~short_delay_buffer_1, \input, ~percussion_send, \out, ~percussion_out, \thresh, ~percussion_onset_thesh_init, \rel, 0.05], target: ~nine_fx_node).register;

	~bass_sampling_loop_0 = Routine({
		loop
		{

			~bass_fx_0_3 = Synth(\buf_write, [\bufnum, ~bass_buffer_0_1, \input, ~bass_send, \loop, 0], target: ~three_fx_node).register; //00:00

			~zero_bass_stream = Pdef( //00:40
				\zero_bass_stream,
				Pbind(
					\instrument, \pattern_buf,
					\dur, Pwhite(0.5, 2),
					\atk, Pwhite(0.5, 2),
					\rel, Pwhite(0.5, 2),
					\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
					\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
					\buf,  ~bass_buffer_0_2,
					\rate, Pwrand(Array.series(16, 0.1, 0.1), (Array.rand(16, 5, 10)).normalizeSum, inf),
					\spos, 0,
					\loop, 1,
					\amp, -12,
					\pan_pos, -1.0,
					\low_pass_mix, 0,
					\low_pass_freq, 5000,
					\high_pass_msix, 1,
					\high_pass_freq, 20,
					\out, ~bass_out,
					\group, ~three_samples_node,
				);
			).play(SystemClock);

			(~bass_buffer_0_1.numFrames/s.sampleRate).wait;


			~bass_fx_0_4 = Synth(\buf_write, [\bufnum, ~bass_buffer_0_2, \input, ~bass_send, \loop, 0], target: ~three_fx_node).register; //00:00

			~zero_bass_stream = Pdef( //00:40
				\zero_bass_stream,
				Pbind(
					\instrument, \pattern_buf,
					\dur, Pwhite(0.5, 2),
					\atk, Pwhite(0.5, 2),
					\rel, Pwhite(0.5, 2),
					\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
					\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
					\buf,  ~bass_buffer_0_1,
					\rate, Pwrand(Array.series(16, 0.1, 0.1), (Array.rand(16, 5, 10)).normalizeSum, inf),
					\spos, 0,
					\loop, 1,
					\amp, -12,
					\pan_pos, -1.0,
					\low_pass_mix, 0,
					\low_pass_freq, 5000,
					\high_pass_mix, 1,
					\high_pass_freq, 20,
					\out, ~bass_out,
					\group, ~three_samples_node,
				);
			).play(SystemClock);

			(~bass_buffer_0_2.numFrames/s.sampleRate).wait;
		}
	}).play(SystemClock);


	14.wait; //01:40

	~trumpet_fx_0_1.set(\gate, 0, \rel, 0.05);
	~percussion_fx_0_1.set(\gate, 0, \rel, 0.05);


	14.wait;// 01:54

	~zero_bass_stream.stop;

	~bass_fx_0_2 = Synth(\wild_delay_1, [\amp, -12, \bufnum, ~short_delay_buffer_2, \input, ~bass_send, \out, ~bass_out, \thresh, ~bass_onset_thesh_init, \rel, 0.05], target: ~nine_fx_node).register;
	~trumpet_fx_0_2 = Synth(\fric, [\amp, -12 ,\input, ~trumpet_send, \out, ~trumpet_out, \grain_speed, 10, \grain_dur, 0.1, \amp_in, ~trumpet_peak_trig_send, \rel, 0.05], target: ~one_fx_node).register; //01:31
	~percussion_fx_0_2 = Synth(\pulse_delay, [\amp, -12, \input, ~percussion_send, \out, ~percussion_out, \amp_input, ~percussion_peak_trig_send, \thresh, ~percussion_onset_thesh_init, \pitch_low, 0.5, \pitch_hi, 1.0, \rel, 11, \delay_low, 0.9, \delay_hi, 1, \delay_factor, 0.2, \rel, 0.05], target: ~four_fx_node).register;

	11.wait; //02:05

	~bass_fx_0_2.set(\gate, 0, \rel, 0.05);
	~trumpet_fx_0_2.set(\gate, 0, \rel, 0.05);
	~percussion_fx_0_2.set(\gate, 0, \rel, 0.05);



}).start(SystemClock);

/*________________________________________________ SAMPLE PLAYBACK __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{
		~zero_samples_routine = Task({ ~clock.set(\reset, 1);

			//00:00
			~noise_1 = Synth(\playbuf, [\bufnum, b[\zero_noise_1][~zero_noise_1_array.at(~zero_noise_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

			s.sync;

			if(~zero_noise_1_array_index > (~zero_noise_1_array.size - 2), {Routine({~zero_noise_1_array = ~zero_noise_1_array.scramble; s.sync; ~zero_noise_1_array_index=0;}).play(SystemClock)}, {~zero_noise_1_array_index = ~zero_noise_1_array_index + 1});

			40.wait; //00:40

			~trumpet_feedback = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_1][0], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 6, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

			~bass_feedback = Synth(\playbuf, [\bufnum, b[\bass_feedback_1][0], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 7, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;


			4.wait;

			~trumpet_feedback.set(\gate, 0);
			~bass_feedback.set(\gate, 0);

			2.wait; //00:46

			~noise_1.set(\gate, 0);

			~buzz_1 = Synth(\playbuf, [\bufnum, b[\zero_buzz_1][~zero_buzz_1_array.at(~zero_buzz_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;
			s.sync;

			if(~zero_buzz_1_array_index > (~zero_buzz_1_array.size - 2), {Routine({~zero_buzz_1_array = ~zero_buzz_1_array.scramble; s.sync; ~zero_buzz_1_array_index=0;}).play(SystemClock)}, {~zero_buzz_1_array_index = ~zero_buzz_1_array_index + 1});

			15.wait; //01:01

			~buzz_1.set(\gate, 0);


			~noise_2 = Synth(\playbuf, [\bufnum, b[\zero_noise_2][~zero_noise_2_array.at(~zero_noise_2_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 5], target: ~zero_samples_node).register;

			s.sync;

			if(~zero_noise_2_array_index > (~zero_noise_2_array.size - 2), {Routine({~zero_noise_2_array = ~zero_noise_2_array.scramble; s.sync; ~zero_noise_2_array_index=0;}).play(SystemClock)}, {~zero_noise_2_array_index = ~zero_noise_2_array_index + 1});

			1.wait;

			~noise_2.set(\gate, 0);

			4.wait; //01:06

			~noise_3 = Synth(\playbuf, [\bufnum, b[\zero_noise_3][~zero_noise_3_array.at(~zero_noise_3_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4], target: ~zero_samples_node);

			s.sync;

			if(~zero_noise_3_array_index > (~zero_noise_3_array.size - 2), {Routine({~zero_noise_3_array = ~zero_noise_3_array.scramble; s.sync; ~zero_noise_3_array_index=0;}).play(SystemClock)}, {~zero_noise_3_array_index = ~zero_noise_3_array_index + 1});

			7.wait; //01:13

			~noise_4 = Synth(\playbuf, [\bufnum, b[\zero_noise_4][~zero_noise_4_array.at(~zero_noise_4_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 2, \rel, 0.005, \out, 5, \c1, 8, \c2, -8], target: ~zero_samples_node).register;

			2.wait; //01:15

			~noise_3.set(\gate, 0);
			~trumpet_feedback = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_1][0], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 6, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

			~bass_feedback = Synth(\playbuf, [\bufnum, b[\bass_feedback_1][0], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 7, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

			s.sync;

			if(~zero_noise_4_array_index > (~zero_noise_4_array.size - 2), {Routine({~zero_noise_4_array = ~zero_noise_4_array.scramble; s.sync; ~zero_noise_4_array_index=0;}).play(SystemClock)}, {~zero_noise_4_array_index = ~zero_noise_4_array_index + 1});

			4.wait; //01:19

			~trumpet_feedback.set(\gate, 0);
			~bass_feedback.set(\gate, 0);

			2.wait; //01:21

			~noise_4.set(\gate, 0);

			9.wait; //01:30

			~noise_1 = Synth(\playbuf, [\bufnum, b[\zero_noise_1][~zero_noise_1_array.at(~zero_noise_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 10, \rel, 0.005, \out, 5, \rate, -1.0, \startPos, 41000*11, \c1, 8, \c2, -8], target: ~zero_samples_node).register;

			s.sync;

			if(~zero_noise_1_array_index > (~zero_noise_1_array.size - 2), {Routine({~zero_noise_1_array = ~zero_noise_1_array.scramble;
				s.sync; ~zero_noise_1_array_index=0;}).play(SystemClock)}, {~zero_noise_1_array_index = ~zero_noise_1_array_index + 1});

			10.wait; //01:40

			~noise_5 = Synth(\playbuf, [\bufnum, b[\three_glitch_1][~three_glitch_1_array.at(~three_glitch_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4], target: ~zero_samples_node).register;

			s.sync;

			if(~three_glitch_1_array_index > (~three_glitch_1_array.size - 2), {Routine({~three_glitch_1_array = ~three_glitch_1_array.scramble; s.sync; ~three_glitch_1_array_index=0;}).play(SystemClock)}, {~three_glitch_1_array_index = ~three_glitch_1_array_index + 1});

			1.wait; //01:41

			~noise_1.set(\gate, 0);
			~noise_5.set(\gate, 0);

			13.wait; //01:54

			~noise_5 = Synth(\playbuf, [\bufnum, b[\sparse_crunch][~sparse_crunch_array.at(~sparse_crunch_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \8, \c2, -8], target: ~zero_samples_node).register;

			s.sync;

			if(~sparse_crunch_array_index > (~sparse_crunch_array.size - 2), {Routine({~sparse_crunch_array = ~sparse_crunch_array.scramble; s.sync; ~sparse_crunch_array_index=0;}).play(SystemClock)}, {~sparse_crunch_array_index = ~sparse_crunch_array_index + 1});

			11.wait; //02:05

			~high_tone_1 = Synth(\playbuf, [\bufnum, b[\zero_high_tone_1][~zero_high_tone_1_array.at(~zero_high_tone_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 20, \out, 5, \c1, \8, \c2, -8], target: ~zero_samples_node).register;
			~noise_5.set(\gate, 0);

			s.sync;

			if(~zero_high_tone_1_array_index > (~zero_high_tone_1_array.size - 2), {Routine({~zero_high_tone_1_array = ~zero_high_tone_1_array.scramble; s.sync; ~zero_high_tone_1_array_index=0;}).play(SystemClock)}, {~zero_high_tone_1_array_index = ~zero_high_tone_1_array_index + 1});

			5.wait;

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);

		}).start(SystemClock);

	},{

/*________________________________________________ REPEAT __________________________________________*/

		~zero_samples_routine = Task({ ~clock.set(\reset, 1);

			~high_tone_1.set(\gate, 0, \rel, 20);

			//00:00
			//00:00
			~noise_1 = Synth(\playbuf, [\bufnum, b[\zero_noise_1][~zero_noise_1_array.at(~zero_noise_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

			s.sync;

			if(~zero_noise_1_array_index > (~zero_noise_1_array.size - 2), {Routine({~zero_noise_1_array = ~zero_noise_1_array.scramble; s.sync; ~zero_noise_1_array_index=0;}).play(SystemClock)}, {~zero_noise_1_array_index = ~zero_noise_1_array_index + 1});

			40.wait; //00:40

			~trumpet_feedback = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_1][0], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 6, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

			~bass_feedback = Synth(\playbuf, [\bufnum, b[\bass_feedback_1][0], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 7, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;


			4.wait;

			~trumpet_feedback.set(\gate, 0);
			~bass_feedback.set(\gate, 0);

			2.wait; //00:46

			~noise_1.set(\gate, 0);

			~buzz_1 = Synth(\playbuf, [\bufnum, b[\zero_buzz_1][~zero_buzz_1_array.at(~zero_buzz_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;
			s.sync;

			if(~zero_buzz_1_array_index > (~zero_buzz_1_array.size - 2), {Routine({~zero_buzz_1_array = ~zero_buzz_1_array.scramble; s.sync; ~zero_buzz_1_array_index=0;}).play(SystemClock)}, {~zero_buzz_1_array_index = ~zero_buzz_1_array_index + 1});

			15.wait; //01:01

			~buzz_1.set(\gate, 0);


			~noise_2 = Synth(\playbuf, [\bufnum, b[\zero_noise_2][~zero_noise_2_array.at(~zero_noise_2_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 5], target: ~zero_samples_node).register;

			s.sync;

			if(~zero_noise_2_array_index > (~zero_noise_2_array.size - 2), {Routine({~zero_noise_2_array = ~zero_noise_2_array.scramble; s.sync; ~zero_noise_2_array_index=0;}).play(SystemClock)}, {~zero_noise_2_array_index = ~zero_noise_2_array_index + 1});

			1.wait;

			~noise_2.set(\gate, 0);

			4.wait; //01:06

			~noise_3 = Synth(\playbuf, [\bufnum, b[\zero_noise_3][~zero_noise_3_array.at(~zero_noise_3_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4], target: ~zero_samples_node);

			s.sync;

			if(~zero_noise_3_array_index > (~zero_noise_3_array.size - 2), {Routine({~zero_noise_3_array = ~zero_noise_3_array.scramble; s.sync; ~zero_noise_3_array_index=0;}).play(SystemClock)}, {~zero_noise_3_array_index = ~zero_noise_3_array_index + 1});

			7.wait; //01:13

			~noise_4 = Synth(\playbuf, [\bufnum, b[\zero_noise_4][~zero_noise_4_array.at(~zero_noise_4_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 2, \rel, 0.005, \out, 5, \c1, 8, \c2, -8], target: ~zero_samples_node).register;

			2.wait; //01:15

			~noise_3.set(\gate, 0);
			~trumpet_feedback = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_1][0], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 6, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

			~bass_feedback = Synth(\playbuf, [\bufnum, b[\bass_feedback_1][0], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 7, \c1, \lin, \c2, \lin], target: ~zero_samples_node).register;

			s.sync;

			if(~zero_noise_4_array_index > (~zero_noise_4_array.size - 2), {Routine({~zero_noise_4_array = ~zero_noise_4_array.scramble; s.sync; ~zero_noise_4_array_index=0;}).play(SystemClock)}, {~zero_noise_4_array_index = ~zero_noise_4_array_index + 1});

			4.wait; //01:19

			~trumpet_feedback.set(\gate, 0);
			~bass_feedback.set(\gate, 0);

			2.wait; //01:21

			~noise_4.set(\gate, 0);

			9.wait; //01:30

			~noise_1 = Synth(\playbuf, [\bufnum, b[\zero_noise_1][~zero_noise_1_array.at(~zero_noise_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 10, \rel, 0.005, \out, 5, \rate, -1.0, \startPos, 41000*11, \c1, 8, \c2, -8], target: ~zero_samples_node).register;

			s.sync;

			if(~zero_noise_1_array_index > (~zero_noise_1_array.size - 2), {Routine({~zero_noise_1_array = ~zero_noise_1_array.scramble;
				s.sync; ~zero_noise_1_array_index=0;}).play(SystemClock)}, {~zero_noise_1_array_index = ~zero_noise_1_array_index + 1});

			10.wait; //01:40

			~noise_5 = Synth(\playbuf, [\bufnum, b[\three_glitch_1][~three_glitch_1_array.at(~three_glitch_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4], target: ~zero_samples_node).register;

			s.sync;

			if(~three_glitch_1_array_index > (~three_glitch_1_array.size - 2), {Routine({~three_glitch_1_array = ~three_glitch_1_array.scramble; s.sync; ~three_glitch_1_array_index=0;}).play(SystemClock)}, {~three_glitch_1_array_index = ~three_glitch_1_array_index + 1});

			1.wait; //01:41

			~noise_1.set(\gate, 0);
			~noise_5.set(\gate, 0);

			13.wait; //01:54

			~noise_5 = Synth(\playbuf, [\bufnum, b[\sparse_crunch][~sparse_crunch_array.at(~sparse_crunch_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4, \c1, \8, \c2, -8], target: ~zero_samples_node).register;

			s.sync;

			if(~sparse_crunch_array_index > (~sparse_crunch_array.size - 2), {Routine({~sparse_crunch_array = ~sparse_crunch_array.scramble; s.sync; ~sparse_crunch_array_index=0;}).play(SystemClock)}, {~sparse_crunch_array_index = ~sparse_crunch_array_index + 1});

			11.wait; //02:05

			~high_tone_1 = Synth(\playbuf, [\bufnum, b[\zero_high_tone_1][~zero_high_tone_1_array.at(~zero_high_tone_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 20, \out, 5, \c1, 8, \c2, -8], target: ~zero_samples_node).register;
			~noise_5.set(\gate, 0);

			s.sync;

			if(~zero_high_tone_1_array_index > (~zero_high_tone_1_array.size - 2), {Routine({~zero_high_tone_1_array = ~zero_high_tone_1_array.scramble; s.sync; ~zero_high_tone_1_array_index=0;}).play(SystemClock)}, {~zero_high_tone_1_array_index = ~zero_high_tone_1_array_index + 1});

			5.wait;

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd")});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);

}).start(SystemClock)});
