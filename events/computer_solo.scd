~easter_egg_index = ~easter_egg_index + 1;

thisProcess.interpreter.executeFile(~file_path++"kill_routinues.scd");

~cue = 13;

~computer_solo_routine = Task({

	~computer_has_soloed = 1;

	thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");

	s.sync;

	~computer_solo_length = Array.series(61, 30, 1).scramble.at(0);

	~computer_solo_stream = Pdef(
		\glitch1,
		Pbind(
			\instrument, \pattern_buf,
			\dur, Pwrand([0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8, 1, 1.5, 2, 2.5, 3, 4, 5, 6], (Array.rand(8, 9, 10)++Array.rand(6, 1, 3)++Array.rand(2, 5, 7)).normalizeSum, inf),
			\atk, Pwrand([0.005, 0.5, 1], [10, 2, 1].normalizeSum, inf),
			\rel, Pwrand([0.005, 0.1, 0.5, 1, 2, 4, 8, 12], [9, 8, 2, 2, 1, 3, 2, 2].normalizeSum, inf),
			\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
			\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
			//              Seoul             Eric                Nature              Glitch              Piano
			\buf, Pwrand([m[\algo_bank_1][0], m[\algo_bank_1][1], m[\algo_bank_1][2], m[\algo_bank_1][3], m[\algo_bank_1][4]], [4, 5, 3, 10, 6].normalizeSum, inf),
			\rate, Pwrand([-10, 10, -8, 8, -6, 6, 4, -4, 0.6, -0.6, 0.4, -0.4, 0.2, -0.2, 0.1, -0.1, 2, -2, 1, -1, 0.8, -0.8],  (Array.rand(8, 4, 6)++Array.rand(8, 1, 3)++Array.rand(6, 9, 10)).normalizeSum, inf),
			\spos, Pif(\buf==~real_time_buffer, Pwhite(0, s.sampleRate*10), Pwhite(0, 36825483)),
			\loop, 1,
			\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
			\low_pass_mix, 0,
			\low_pass_freq, 5000,
			\high_pass_mix, 1,
			\high_pass_freq, 40,
			\pan_pos, Pwhite(-1.0, 1.0, inf),
			\out, 6,
			\group, ~one_samples_node,
		);
	).play(SystemClock);

	~clock.set(\reset, 0);

	s.sync;

	~clock.set(\reset, 1);

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


	~computer_solo_length.wait;

	Routine({
		~clock.set(\reset, 0);
		s.sync;
		if(~index != 12, {thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");}, {~cue=18; thisProcess.interpreter.executeFile(~file_path++"end_piece.scd");});
	}).play(SystemClock);
}).start(AppClock);
