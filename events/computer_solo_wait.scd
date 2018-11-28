Routine({

	s.sync;

	if(~computer_solo_array.at(~computer_solo_array_index) == 1,
		{~computer_solo_wait_routine =
			Routine({

				~computer_solo_array_index = ~computer_solo_array_index + 1;

				~computer_wait = Array.series(30, 5, 1).scramble.at(0);

				~computer_wait.wait;

				thisProcess.interpreter.executeFile(~file_path++"computer_solo.scd");

			}).play(SystemClock);


		},
		{~computer_solo_array_index = ~computer_solo_array_index + 1;});

}).play(SystemClock);

