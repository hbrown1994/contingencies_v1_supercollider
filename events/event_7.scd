/*________________________________________________ LIVE PROCESSING __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),

	{
		Routine({
			thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");
			s.sync;
			~input_sum_7 = Synth(\input_sum, [\gate, 1], target: ~input_sum).register;
			~greyhole_7 = Synth(\greyhole_1, [\amp, 0, \gate, 1, \rel, 0.05, \in, ~input_sum_send , \out, ~trumpet_out, \damping, 0.2], target: ~eight_fx_node).register;
		}).play(SystemClock);

}, {nil});
/*________________________________________________ SAMPLE PLAYBACK __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{


		~seven_samples_routine = Task({

			~clock.set(\reset, 1);

			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

			0.01.wait;

			//00:00
			~drone_1 = Synth(\playbuf, [\bufnum, b[\seven_drone_1][~seven_drone_1_array.at(~seven_drone_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 10, \rel, 0.05, \out, 3], target: ~seven_samples_node).register;


			s.sync;

			if(~seven_drone_1_array_index > (~seven_drone_1_array.size - 2), {Routine({~seven_drone_1_array = ~seven_drone_1_array.scramble; s.sync; ~seven_drone_1_array_index=0;}).play(SystemClock)}, {~seven_drone_1_array_index = ~seven_drone_1_array_index + 1});

			70.wait;

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
		~seven_samples_routine = Task({ ~clock.set(\reset, 1);

			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

			~drone_1.set(\gate, 0, \rel, 20);
			~drone_1_1 = Synth(\playbuf, [\bufnum, b[\seven_drone_1][~seven_drone_1_array.at(~seven_drone_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 10, \rel, 0.05, \out, 3, \rate, 0.9], target: ~seven_samples_node).register;

			70.wait;

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);

			"7 -> done".postln;

		}).start(SystemClock);
});

