/*________________________________________________ LIVE PROCESSING __________________________________________*/
if(~array.at(~index-1) != ~array.at(~index),
	{~four_fx_routine = Task({
		thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

		s.sync;

		~trumpet_fx_4 = Synth(\pulse_delay, [\input, ~trumpet_send, \out, ~trumpet_out, \amp_input, ~trumpet_peak_trig_send, \thresh, ~trumpet_onset_thesh_init, \rel, 11], target: ~four_fx_node).register;
		~bass_fx_4 = Synth(\pulse_delay, [\input, ~bass_send, \out, ~bass_out, \amp_input, ~bass_peak_trig_send, \thresh, ~bass_onset_thesh_init, \pitch_low, 0.9, \pitch_hi, 1.9, \rel, 11], target: ~four_fx_node).register;

		~percussion_fx_4_1 = Synth(\pulse_delay, [\input, ~percussion_send, \out, ~percussion_out, \amp_input, ~percussion_peak_trig_send, \thresh, ~percussion_onset_thesh_init, \pitch_low, 0.5, \pitch_hi, 1.0, \rel, 11, \delay_low, 0.9, \delay_hi, 1, \delay_factor, 0.4], target: ~four_fx_node).register;

		38.wait;

		~trumpet_fx_4.set(\gate, 0);


		12.wait; //00:50

		~trumpet_fx_4_1 = Synth(\wild_delay_1, [\bufnum, ~short_delay_buffer_3, \input, ~trumpet_send, \out, ~trumpet_out, \thresh, ~trumpet_onset_thesh_init, \rel, 0.05, \amp, -12], target: ~nine_fx_node).register;


		36.wait; //01:26

		~trumpet_fx_4_1.set(\gate, 0);
		~percussion_fx_4_1.set(\gate, 0);
		~bass_fx_4.set(\gate, 0);



		~bass_4_fx_2 = Synth(\freeze_grain_perc, [\rel, 0.05, \gate, 1, \amp, -12, \grain_speed, 10, \grain_dur, 0.05, \atk, 0.5, \input, ~bass_send, \out, ~bass_out, \amp_trig_input, ~bass_peak_trig_send, \grain_dev, 0.01, \thresh, ~bass_onset_thesh_init], target: ~four_fx_node).register;
		~percussion_4_fx_2 = Synth(\freeze_grain_perc, [\rel, 0.05,\gate, 1, \amp, -12, \grain_speed, 10, \grain_dur, 0.05, \atk, 0.5, \input, ~percussion_send, \out, ~percussion_out, \amp_trig_input, ~percussion_peak_trig_send, \grain_dev, 0.01, \thresh, ~percussion_onset_thesh_init], target: ~four_fx_node).register;

		4.wait; //01:30

		~trumpet_fx_4_1.set(\gate, 0);
		~bass_4_fx_2.set(\gate, 0);
		~percussion_4_fx_2.set(\gate, 0);


		~input_sum_4 = Synth(\input_sum, [\gate, 1], target: ~input_sum).register;
		~greyhole_4 = Synth(\greyhole_1, [\amp, -12, \gate, 1, \rel, 10, \in, ~input_sum_send , \out, ~trumpet_out], target: ~four_fx_node).register;


	}).start(SystemClock);


	},
/*________________________________________________ REPEAT __________________________________________*/

	{
		~four_fx_routine = Task({
			thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

			s.sync;

			~trumpet_fx_4 = Synth(\pulse_delay, [\input, ~trumpet_send, \out, ~trumpet_out, \amp_input, ~trumpet_peak_trig_send, \thresh, ~trumpet_onset_thesh_init, \rel, 11], target: ~four_fx_node).register;
			~bass_fx_4 = Synth(\pulse_delay, [\input, ~bass_send, \out, ~bass_out, \amp_input, ~bass_peak_trig_send, \thresh, ~bass_onset_thesh_init, \pitch_low, 0.9, \pitch_hi, 1.9, \rel, 11], target: ~four_fx_node).register;

			~percussion_fx_4_1 = Synth(\pulse_delay, [\input, ~percussion_send, \out, ~percussion_out, \amp_input, ~percussion_peak_trig_send, \thresh, ~percussion_onset_thesh_init, \pitch_low, 0.5, \pitch_hi, 1.0, \rel, 11, \delay_low, 0.9, \delay_hi, 1, \delay_factor, 0.4], target: ~four_fx_node).register;

			38.wait;

			~trumpet_fx_4.set(\gate, 0);


			12.wait; //00:50

			~trumpet_fx_4_1 = Synth(\wild_delay_1, [\bufnum, ~short_delay_buffer_3, \input, ~trumpet_send, \out, ~trumpet_out, \thresh, ~trumpet_onset_thesh_init, \rel, 0.05, \amp, -12], target: ~nine_fx_node).register;


			36.wait; //01:26

			~trumpet_fx_4_1.set(\gate, 0);
			~percussion_fx_4_1.set(\gate, 0);
			~bass_fx_4.set(\gate, 0);



			~bass_4_fx_2 = Synth(\freeze_grain_perc, [\rel, 0.05, \gate, 1, \amp, -12, \grain_speed, 10, \grain_dur, 0.05, \atk, 0.5, \input, ~bass_send, \out, ~bass_out, \amp_trig_input, ~bass_peak_trig_send, \grain_dev, 0.01, \thresh, ~bass_onset_thesh_init], target: ~four_fx_node).register;
			~percussion_4_fx_2 = Synth(\freeze_grain_perc, [\rel, 0.05,\gate, 1, \amp, -12, \grain_speed, 10, \grain_dur, 0.05, \atk, 0.5, \input, ~percussion_send, \out, ~percussion_out, \amp_trig_input, ~percussion_peak_trig_send, \grain_dev, 0.01, \thresh, ~percussion_onset_thesh_init], target: ~four_fx_node).register;

			4.wait; //01:30

			~trumpet_fx_4_1.set(\gate, 0);
			~bass_4_fx_2.set(\gate, 0);
			~percussion_4_fx_2.set(\gate, 0);


			~input_sum_4 = Synth(\input_sum, [\gate, 1], target: ~input_sum).register;
			~greyhole_4 = Synth(\greyhole_1, [\amp, -12, \gate, 1, \rel, 10, \in, ~input_sum_send , \out, ~trumpet_out], target: ~four_fx_node).register;


		}).start(SystemClock);
});

/*________________________________________________ SAMPLE PLAYBACK __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{

		~four_samples_routine = Task({ ~clock.set(\reset, 1);

			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

			//00:00
			~pulse_1 = Synth(\playbuf, [\bufnum, b[\four_pulse_1][~four_pulse_1_array.at(~four_pulse_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 10, \out, 3], target: ~four_samples_node).register;

			s.sync;

			if(~four_pulse_1_array_index > (~four_pulse_1_array.size - 2), {Routine({~four_pulse_1_array = ~four_pulse_1_array.scramble; s.sync; ~four_pulse_1_array_index=0;}).play(SystemClock)}, {~four_pulse_1_array_index = ~four_pulse_1_array_index + 1});

			5.wait; //00:05

			~pulse_1.set(\gate, 0);

			17.wait; //00:22

			~pulse_3 = Synth(\playbuf, [\bufnum, b[\four_pulse_1][~four_pulse_1_array.at(~four_pulse_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 20, \rel, 20, \out, 4, \rate, 0.5, \c1, 8, \c2, -8], target: ~four_samples_node).register;

			s.sync;

			if(~four_pulse_1_array_index > (~four_pulse_1_array.size - 2), {Routine({~four_pulse_1_array = ~four_pulse_1_array.scramble; s.sync; ~four_pulse_1_array_index=0;}).play(SystemClock)}, {~four_pulse_1_array_index = ~four_pulse_1_array_index + 1});

			17.wait; //00:39

			~sub = Synth(\playbuf, [\bufnum, b[\sub_2][~sub_2_array.at(~sub_2_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 11, \rel, 20, \out, 5, \c1, 8, \c2, -8], target: ~four_samples_node).register;

			~pulse_3.set(\gate, 0);

			s.sync;

			if(~sub_2_array_index > (~sub_2_array.size - 2), {Routine({~sub_2_array = ~sub_2_array.scramble; s.sync; ~sub_2_array_index=0;}).play(SystemClock)}, {~sub_2_array_index = ~sub_2_array_index + 1});

			11.wait; //00:50
			~sub.set(\gate, 0);
			~pulse_2 = Synth(\playbuf, [\bufnum, b[\four_pulse_2][~four_pulse_2_array.at(~four_pulse_2_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 10, \out, 3, \c1, 8, \c2, -8], target: ~four_samples_node).register;

			s.sync;

			if(~four_pulse_2_array_index > (~four_pulse_2_array.size - 2), {Routine({~four_pulse_2_array = ~four_pulse_2_array.scramble; s.sync; ~four_pulse_2_array_index=0;}).play(SystemClock)}, {~four_pulse_2_array_index = ~four_pulse_2_array_index + 1});

			5.wait; //00:55

			~pulse_1 = Synth(\playbuf, [\bufnum, b[\four_pulse_1][~four_pulse_1_array.at(~four_pulse_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 20, \rel, 0.05, \out, 4, \c1, 8, \c2, -8], target: ~four_samples_node).register;


			s.sync;

			if(~four_pulse_1_array_index > (~four_pulse_1_array.size - 2), {Routine({~four_pulse_1_array = ~four_pulse_1_array.scramble; s.sync; ~four_pulse_1_array_index=0;}).play(SystemClock)}, {~four_pulse_1_array_index = ~four_pulse_1_array_index + 1});

			21.wait; //01:16

			~pulse_1.set(\gate, 0);

			10.wait; //01:26

			~pulse_3 = Synth(\playbuf, [\bufnum, b[\four_pulse_2][~four_pulse_2_array.at(~four_pulse_2_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3], target: ~four_samples_node).register;

			s.sync;

			if(~four_pulse_2_array_index > (~four_pulse_2_array.size - 2), {Routine({~four_pulse_2_array = ~four_pulse_2_array.scramble; s.sync; ~four_pulse_2_array_index=0;}).play(SystemClock)}, {~four_pulse_2_array_index = ~four_pulse_2_array_index + 1});

			~drums_1 = Synth(\playbuf, [\bufnum, b[\drums_1][~drums_1_array.at(~drums_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4], target: ~four_samples_node).register;

			s.sync;

			if(~drums_1_array_index > (~drums_1_array.size - 2), {Routine({~drums_1_array = ~drums_1_array.scramble; s.sync; ~drums_1_array_index=0;}).play(SystemClock)}, {~drums_1_array_index = ~drums_1_array_index + 1});

			2.wait; //01:26
			~pulse_3.set(\gate, 0);
			~drums_1.set(\gate, 0);
			~pulse_2.set(\gate, 0);

			4.wait; //01:32

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
		~pulse_2.set(\gate, 0);

		~four_samples_routine = Task({ ~clock.set(\reset, 1);

			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

			//00:00
			~pulse_1 = Synth(\playbuf, [\bufnum, b[\four_pulse_1][~four_pulse_1_array.at(~four_pulse_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 10, \out, 3], target: ~four_samples_node).register;

			s.sync;

			if(~four_pulse_1_array_index > (~four_pulse_1_array.size - 2), {Routine({~four_pulse_1_array = ~four_pulse_1_array.scramble; s.sync; ~four_pulse_1_array_index=0;}).play(SystemClock)}, {~four_pulse_1_array_index = ~four_pulse_1_array_index + 1});

			5.wait; //00:05

			~pulse_1.set(\gate, 0);

			17.wait; //00:21

			~pulse_3 = Synth(\playbuf, [\bufnum, b[\four_pulse_1][~four_pulse_1_array.at(~four_pulse_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 20, \rel, 20, \out, 4, \rate, 0.5, \c1, 8, \c2, -8], target: ~four_samples_node).register;

			s.sync;

			if(~four_pulse_1_array_index > (~four_pulse_1_array.size - 2), {Routine({~four_pulse_1_array = ~four_pulse_1_array.scramble; s.sync; ~four_pulse_1_array_index=0;}).play(SystemClock)}, {~four_pulse_1_array_index = ~four_pulse_1_array_index + 1});

			17.wait; //00:39

			~sub = Synth(\playbuf, [\bufnum, b[\sub_2][~sub_2_array.at(~sub_2_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 11, \rel, 20, \out, 5, \c1, 8, \c2, -8], target: ~four_samples_node).register;

			~pulse_3.set(\gate, 0);

			s.sync;

			if(~sub_2_array_index > (~sub_2_array.size - 2), {Routine({~sub_2_array = ~sub_2_array.scramble; s.sync; ~sub_2_array_index=0;}).play(SystemClock)}, {~sub_2_array_index = ~sub_2_array_index + 1});

			11.wait; //00:50
			~sub.set(\gate, 0);
			~pulse_2 = Synth(\playbuf, [\bufnum, b[\four_pulse_2][~four_pulse_2_array.at(~four_pulse_2_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 10, \out, 3, \c1, 8, \c2, -8], target: ~four_samples_node).register;

			s.sync;

			if(~four_pulse_2_array_index > (~four_pulse_2_array.size - 2), {Routine({~four_pulse_2_array = ~four_pulse_2_array.scramble; s.sync; ~four_pulse_2_array_index=0;}).play(SystemClock)}, {~four_pulse_2_array_index = ~four_pulse_2_array_index + 1});

			5.wait; //00:55

			~pulse_1 = Synth(\playbuf, [\bufnum, b[\four_pulse_1][~four_pulse_1_array.at(~four_pulse_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 20, \rel, 0.05, \out, 4, \c1, 8, \c2, -8], target: ~four_samples_node).register;


			s.sync;

			if(~four_pulse_1_array_index > (~four_pulse_1_array.size - 2), {Routine({~four_pulse_1_array = ~four_pulse_1_array.scramble; s.sync; ~four_pulse_1_array_index=0;}).play(SystemClock)}, {~four_pulse_1_array_index = ~four_pulse_1_array_index + 1});

			21.wait; //01:16

			~pulse_1.set(\gate, 0);

			10.wait; //01:26

			~pulse_3 = Synth(\playbuf, [\bufnum, b[\four_pulse_2][~four_pulse_2_array.at(~four_pulse_2_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 3], target: ~four_samples_node).register;

			s.sync;

			if(~four_pulse_2_array_index > (~four_pulse_2_array.size - 2), {Routine({~four_pulse_2_array = ~four_pulse_2_array.scramble; s.sync; ~four_pulse_2_array_index=0;}).play(SystemClock)}, {~four_pulse_2_array_index = ~four_pulse_2_array_index + 1});

			~drums_1 = Synth(\playbuf, [\bufnum, b[\drums_1][~drums_1_array.at(~drums_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 4], target: ~four_samples_node).register;

			s.sync;

			if(~drums_1_array_index > (~drums_1_array.size - 2), {Routine({~drums_1_array = ~drums_1_array.scramble; s.sync; ~drums_1_array_index=0;}).play(SystemClock)}, {~drums_1_array_index = ~drums_1_array_index + 1});

			2.wait; //01:26
			~pulse_3.set(\gate, 0);
			~drums_1.set(\gate, 0);
			~pulse_2.set(\gate, 0);

			4.wait; //01:32

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);

		}).start(SystemClock);
});