/*________________________________________________ LIVE PROCESSING __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{
		~nine_fx_routine = Task({

			thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

			s.sync;

			~clock.set(\reset, 1);

			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});
			~trumpet_fx_9 = Synth(\long_delay, [\bufnum, ~long_delay_buffer_3, \input, ~trumpet_send, \out, ~trumpet_out, \thresh, ~trumpet_onset_thesh_init, \amp, -12], target:~nine_fx_node).register;
			~bass_fx_9 = Synth(\long_delay, [\bufnum, ~long_delay_buffer_2, \input, ~bass_send, \out, ~bass_out, \thresh, ~bass_onset_thesh_init, \amp, -12], target: ~nine_fx_node).register;
			~percussion_fx_9 = Synth(\long_delay, [\bufnum, ~long_delay_buffer_1, \input, ~percussion_send, \out, ~percussion_out, \thresh, ~percussion_onset_thesh_init, \amp, -12], target:~nine_fx_node).register;

			55.wait;

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);
			"9 -> done".postln;

		}).start(SystemClock);

	},
/*________________________________________________ REPEAT __________________________________________*/

	{~nine_fx_routine = Task({

		~clock.set(\reset, 1);

		if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

		55.wait;


		Routine({
			~clock.set(\reset, 0);
			s.sync;
			if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
			if(~index == (~array_size+1), {"piece done".postln});
		}).play(SystemClock);

		"9 -> done".postln;


	}).start(SystemClock);
});
