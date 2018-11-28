/*________________________________________________ LIVE PROCESSING __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{

		Routine({
			thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");
			s.sync;
			~trumpet_fx_2 = Synth(\freeze_grain, [\gate, 1, \amp, -12, \grain_speed, 10, \grain_dur, 0.05, \atk, 0.5, \input, ~trumpet_send, \out, ~trumpet_out, \amp_trig_input, ~trumpet_peak_trig_send], target: ~two_fx_node).register;
			~bass_fx_2 = Synth(\bass_pitch, [\gate, 1,  \amp, -12, \input, ~bass_send, \amp_input, ~bass_peak_trig_send, \out, ~bass_out], target: ~two_fx_node).register;
			~percussion_fx_2 = Synth(\freeze_grain_perc, [\gate, 1, \amp, -12, \grain_speed, 10, \grain_dur, 0.05, \atk, 0.5, \input, ~percussion_send, \out, ~percussion_out, \amp_trig_input, ~percussion_peak_trig_send, \grain_dev, 0.01, \thresh, ~percussion_onset_thesh_init], target: ~two_fx_node).register;
		}).play(SystemClock);

},{nil});


/*________________________________________________ SAMPLE PLAYBACK __________________________________________*/


if(~array.at(~index-1) != ~array.at(~index),
	{
		~two_samples_routine = Task({ ~clock.set(\reset, 1);

			if(~rehearsal_mode == 0,
				{thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

			0.006.wait;

			//00:00

			~trumpet_feedback_1 = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_2][0], \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 6, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*660).choose, \loop, 1], target: ~two_samples_node).register;

			~bass_feedback_1 = Synth(\playbuf, [\bufnum, b[\bass_feedback_2][[0, 1, 2, 3].choose], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 7, \c1, \lin, \c2, \lin], target: ~two_samples_node).register;

			30.wait;

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				thisProcess.interpreter.executeFile(~file_path++"field_recording_3.scd");
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);


			"2 -> done".postln;

		}).start(SystemClock);

	},
/*________________________________________________ REPEAT __________________________________________*/

	{~two_samples_routine = Task({ ~clock.set(\reset, 1);

		if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

		~trumpet_feedback_1.set(\gate, 0);
		~bass_feedback_1.set(\gate, 0);

		0.006.wait;
		//00:00

		~trumpet_feedback_1 = Synth(\playbuf, [\bufnum, b[\trumpet_feedback_2][0], \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 6, \c1, \lin, \c2, \lin, \startPos, Array.interpolation(100, 0, s.sampleRate*660).choose, \loop, 1], target: ~two_samples_node).register;

		~bass_feedback_1 = Synth(\playbuf, [\bufnum, b[\bass_feedback_2][[0, 1, 2, 3].choose], \loop, 1, \gate, 1, \amp, -12, \atk, 0.005, \rel, 0.005, \out, 7, \c1, \lin, \c2, \lin], target: ~two_samples_node).register;

		30.wait;

		Routine({
			~clock.set(\reset, 0);
			s.sync;
			thisProcess.interpreter.executeFile(~file_path++"field_recording_3.scd");
			if(~index == (~array_size+1), {"piece done".postln});
		}).play(SystemClock);


}).start(SystemClock)});

