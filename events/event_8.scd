/*________________________________________________ LIVE PROCESSING __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{
		~eight_fx_routine = Task({


			thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

			s.sync;

			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});

			~percussion_fx_8 = Synth(\ntube_1, [\amp, -12, \loss, 0.999, \in, ~percussion_send, \out, ~percussion_out, \rel, 30, \atk, 10], target: ~nine_fx_node).register;

			~trumpet_fx_8 = Synth(\ntube_2, [\amp, -12, \speed, 100, \in, ~trumpet_send, \out, ~trumpet_out, \rel, 30],target: ~nine_fx_node).register;

			~bass_contact_mic = Synth(\bass_contact, [\gate, 1], target: ~input).register;

			~bass_fx_8_contact = Synth(\ntube_3, [\amp, -12, \k, 0.01, \loss, 0.98, \in, ~bass_contact_send, \out, 6, \rel, 0.05], target: ~nine_fx_node).register;

			~bass_fx_8 = Synth(\greyhole_2, [\amp, -12, \gate, 1, \rel, 30, \in, ~bass_send , \out, ~bass_out], target: ~nine_fx_node).register;

			119.wait;

			~bass_fx_8.set(\pan, 1);

		}).start(SystemClock);
	},
/*________________________________________________ REPEAT __________________________________________*/

	{
		~eight_fx_routine = Task({

			~bass_fx_8.set(\pan, -1);
			119.wait;
			~bass_fx_8.set(\pan, 1);
		}).start(SystemClock);

});

/*________________________________________________ SAMPLE PLAYBACK __________________________________________*/

if(~array.at(~index-1) != ~array.at(~index),
	{
		~eight_samples_routine = Task({


			~clock.set(\reset, 1);

			if(~rehearsal_mode == 0, {thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd")}, {nil});
			//00:00
			~drone_1 = Synth(\playbuf, [\bufnum, b[\eight_drone_1][~eight_drone_1_array.at(~eight_drone_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 10, \rel, 30, \out, 4, \c1, 8, \c2, -8], target: ~five_samples_node).register;

			s.sync;

			if(~eight_drone_1_array_index > (~eight_drone_1_array.size - 2), {Routine({~eight_drone_1_array = ~eight_drone_1_array.scramble; s.sync; ~eight_drone_1_array_index=0;}).play(SystemClock)}, {~eight_drone_1_array_index = ~eight_drone_1_array_index + 1});

			76.wait;//01:16

			~noise_1 = Synth(\playbuf, [\bufnum, b[\eight_noise_1][~eight_noise_1_array.at(~eight_noise_1_array_index)], \loop, 0, \gate, 1, \amp, 0, \atk, 0.005, \rel, 0.005, \out, 5, \c1, 8, \c2, -8], target: ~five_samples_node).register;

			s.sync;

			if(~eight_noise_1_array_index > (~eight_noise_1_array.size - 2), {Routine({~eight_noise_1_array = ~eight_noise_1_array.scramble; s.sync; ~eight_noise_1_array_index=0;}).play(SystemClock)}, {~eight_noise_1_array_index = ~eight_noise_1_array_index + 1});

			5.wait;//01:21
			~noise_1.set(\gate, 0);

			30.wait;//01:51
			~noise_1 = Synth(\playbuf, [\bufnum, b[\eight_noise_1][~eight_noise_1_array.at(~eight_noise_1_array_index)], \loop, 0, \gate, 1, \amp, 0, \atk, 0.005, \rel, 0.005, \out, 5, \c1, 8, \c2, -8], target: ~five_samples_node).register;

			s.sync;

			if(~eight_noise_1_array_index > (~eight_noise_1_array.size - 2), {Routine({~eight_noise_1_array = ~eight_noise_1_array.scramble; s.sync; ~eight_noise_1_array_index=0;}).play(SystemClock)}, {~eight_noise_1_array_index = ~eight_noise_1_array_index + 1});

			4.wait;//01:51

			~noise_1.set(\gate, 0);

			14.wait;//02:10


			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);

			"8 -> done".postln;

		}).start(SystemClock);
	},
/*________________________________________________ REPEAT __________________________________________*/

	{~drone_1.set(\gate, 0);
		~eight_samples_routine = Task({


			~clock.set(\reset, 1);


			//00:00
			~drone_1_1 = Synth(\playbuf, [\bufnum, b[\eight_drone_1][~eight_drone_1_array.at(~eight_drone_1_array_index)], \loop, 0, \gate, 1, \amp, -12, \atk, 10, \rel, 30, \out, 3], target: ~five_samples_node).register;

			s.sync;

			if(~eight_drone_1_array_index > (~eight_drone_1_array.size - 2), {Routine({~eight_drone_1_array = ~eight_drone_1_array.scramble; s.sync; ~eight_drone_1_array_index=0;}).play(SystemClock)}, {~eight_drone_1_array_index = ~eight_drone_1_array_index + 1});

			76.wait;//01:16

			~noise_1 = Synth(\playbuf, [\bufnum, b[\eight_noise_1][~eight_noise_1_array.at(~eight_noise_1_array_index)], \loop, 0, \gate, 1, \amp, 0, \atk, 0.005, \rel, 0.005, \out, 5, \c1, 8, \c2, -8], target: ~five_samples_node).register;

			s.sync;

			if(~eight_noise_1_array_index > (~eight_noise_1_array.size - 2), {Routine({~eight_noise_1_array = ~eight_noise_1_array.scramble; s.sync; ~eight_noise_1_array_index=0;}).play(SystemClock)}, {~eight_noise_1_array_index = ~eight_noise_1_array_index + 1});

			5.wait;//01:21
			~noise_1.set(\gate, 0);

			30.wait;//01:51
			~noise_1 = Synth(\playbuf, [\bufnum, b[\eight_noise_1][~eight_noise_1_array.at(~eight_noise_1_array_index)], \loop, 0, \gate, 1, \amp, 0, \atk, 0.005, \rel, 0.005, \out, 5, \c1, 8, \c2, -8], target: ~five_samples_node).register;

			s.sync;

			if(~eight_noise_1_array_index > (~eight_noise_1_array.size - 2), {Routine({~eight_noise_1_array = ~eight_noise_1_array.scramble; s.sync; ~eight_noise_1_array_index=0;}).play(SystemClock)}, {~eight_noise_1_array_index = ~eight_noise_1_array_index + 1});

			4.wait;//01:51

			~noise_1.set(\gate, 0);

			14.wait;//02:10

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
				if(~index == (~array_size+1), {"piece done".postln});
			}).play(SystemClock);


		}).start(SystemClock);

});
