if(~easter_egg_array.at(~easter_egg_index) == 3, {thisProcess.interpreter.executeFile(~file_path++"field_recording_2.scd")},{if(~easter_egg_array.at(~easter_egg_index) == 2, {thisProcess.interpreter.executeFile(~file_path++"field_recording_1.scd")},{if(~easter_egg_array.at(~easter_egg_index) == 0,
	{
		"bass solo".postln;

		~easter_egg_index = ~easter_egg_index + 1;

		thisProcess.interpreter.executeFile(~file_path++"kill_routinues.scd");
		thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd");

		~cue = 11;

		~bass_solo_routine = Task({

			~bass_solo_length = 120;

			~clock.set(\reset, 0);

			s.sync;

			~clock.set(\reset, 1);

			thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

			s.sync;

			~bass_fx_solo = Synth(\concat_bass, [\input, ~bass_send, \out, ~bass_out, \gate, 1, \bufnum, b[\drums_2][0], \zcr, 0.1, \lms, 0.1, \sc, 1 , \st, 0.2, \matchlength, 0.05], target: ~one_fx_node).register;

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


			~bass_solo_length.wait;

			Routine({

				~clock.set(\reset, 0);
				s.sync;
				if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
			}).play(SystemClock);


		}).start(AppClock);
},{nil});
});
});



