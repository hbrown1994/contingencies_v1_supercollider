~easter_egg_index = ~easter_egg_index + 1;


thisProcess.interpreter.executeFile(~file_path++"kill_routinues.scd");
thisProcess.interpreter.executeFile(~file_path++"kill_synths.scd");
thisProcess.interpreter.executeFile(~file_path++"computer_solo_wait.scd");

~cue = 15; //-> img15

~field_recording_1_routine = Task({

	~field_recording_1_wait_time = Array.series(61, 60, 1).scramble.at(0);

	s.sync;

	~field_recording_1 = Synth(\playbuf_field, [\bufnum, b[\field_recording_1][~field_recording_1_array.at(~field_recording_1_array_index)], \loop, 0, \gate, 1, \amp, -12,  \out, 6, \loop, 1, \c1, 4, \c2, -4], target: ~four_samples_node).register;

	if(~field_recording_1_array_index > (~field_recording_1_array.size - 2), {Routine({~field_recording_1_array = ~field_recording_1_array.scramble; s.sync; ~field_recording_1_array_index=0;}).play(SystemClock)}, {~field_recording_1_array_index = ~field_recording_1_array_index + 1});


	~clock.set(\reset, 0);

	s.sync;

	~clock.set(\reset, 1);


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

	~field_recording_1_wait_time.wait;

	Routine({
		~clock.set(\reset, 0);
		s.sync;
		thisProcess.interpreter.executeFile(~file_path++"event_"++ (~cue=~array.at(~index = ~index+1))++".scd");
		if(~index == (~array_size+1), {"piece done".postln});
	}).play(SystemClock);

}).start(SystemClock);