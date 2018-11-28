~index=0;
~clock.set(\reset, 0, \clock_speed, 10);

s.freeAll;
CmdPeriod.run;

c[0].children[0].value_(0);
//stop streams
10.do{
	arg i=(-1);
	{i = i + 1};
	c[1].children[i].value_(0)
};