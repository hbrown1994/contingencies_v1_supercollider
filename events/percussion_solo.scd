if(~easter_egg_array.at(~easter_egg_index) == 3, {thisProcess.interpreter.executeFile(~file_path++"field_recording_2.scd")},{if(~easter_egg_array.at(~easter_egg_index) == 2, {thisProcess.interpreter.executeFile(~file_path++"field_recording_1.scd")},{if(~easter_egg_array.at(~easter_egg_index) == 0,
	{
		"percussion solo".postln;

		~easter_egg_index = ~easter_egg_index + 1;

		thisProcess.interpreter.executeFile(~file_path++"kill_routinues.scd");
		thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd");

		~cue = 12;

		~percussion_solo_routine = Task({

			~percussion_solo_length = Array.series(61, 30, 1).scramble.at(0);

			~clock.set(\reset, 0);

			s.sync;

			~clock.set(\reset, 1);

			thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

			s.sync;

			~percussion_fx_solo = Synth(\ntube_9, [\amp, -12, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~percussion_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~percussion_out, \amp_input_bus,~percussion_rms_send, \amp_input_bus_trig, ~percussion_peak_trig_send], target: ~nine_fx_node).register;

			s.sync;

			~random_index = Array[0, 2, 3, 4, 5, 6, 7, 8, 9, 1, 0, 2, 3, 4, 5, 6, 7, 8, 9, 1];

			~random_index =  ~random_index.scramble;

			~random_index_index = 0;

			~pre_array = Array[0, 2, 3, 4, 5, 6, 7, 8, 9, 1];

			s.sync;

			~pre_array = ~pre_array.sputter(probability: 0.25, maxlen: 13);

			0.1.wait;

			~pre_array = ~pre_array.scramble;

			s.sync;

			~pre_array = ~pre_array.reverse;

			s.sync;

			if(~pre_array.size <= 12, {

				Routine({
					~pre_array.add(~random_index.at(~random_index_index));
					0.05.wait;
					~random_index_index = ~random_index_index + 1;

				}).play(AppClock);
			});

			s.sync;

			if(~pre_array.size <= 12, {
				Routine({
					~pre_array.add(~random_index.at(~random_index_index));
					0.05.wait;
					~random_index_index = ~random_index_index + 1;

				}).play(AppClock);

			});

			s.sync;

			~array = ~pre_array;

			~array.postln;


			~percussion_solo_length.wait;

			Routine({
				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
			}).play(SystemClock);
			"9 -> done".postln;
		}).start(AppClock);
},{nil});});});



