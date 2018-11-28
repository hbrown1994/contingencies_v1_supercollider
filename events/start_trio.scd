Routine({

	~clock.set(\min, 35, \max, 3500, \reset, 1, \clock_speed, 10);

	s.sync;

	e[~cue.asSymbol].value;

}).play(AppClock);