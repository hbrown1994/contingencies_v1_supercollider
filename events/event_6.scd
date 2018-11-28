/*________________________________________________ SAMPLE PLAYBACK __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{ thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");




		~six_samples_routine = Task({ ~clock.set(\reset, 1);

			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});



			~wait_time_six = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].choose;
			s.sync;

			~soft_noise_1 = Synth(\playbuf, [\bufnum, b[\soft_noise_1][0], \loop, 0, \gate, 1, \amp, 0, \atk, 0.05, \rel, 0.05, \out, 3], target: ~seven_samples_node).register;

			~wait_time_six.wait;


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
		~six_samples_routine_1 = Task({ ~clock.set(\reset, 1);


			~wait_time_six = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].choose;
			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

			s.sync;

			~wait_time_six.wait;


			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);

		}).start(SystemClock);
});

