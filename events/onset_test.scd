//Test onset triggers for various live processing modules
~trumpet_gui_track = Ndef(\amp_track_trumpet_gui, {
	var data= In.kr(~trumpet_peak_trig_send, 1);
	var trig= Impulse.kr(100);

	SendReply.kr(trig, "/innerOscFlow_trumpet_gui", data);
});



OSCFunc({|msg|
	~trumpet_onset_msg = msg[3];
}, "/innerOscFlow_trumpet_gui");



~get_trumpet_onset_routine = Routine({
	loop{
		~onset_button_trumpet.valueAction_(~trumpet_onset_msg);
		0.01.wait;
	}
}).play(AppClock);




~bass_gui_track = Ndef(\amp_track_bass_gui, {
	var data= In.kr(~bass_peak_trig_send, 1);
	var trig= Impulse.kr(100);

	SendReply.kr(trig, "/innerOscFlow_bass_gui", data);
});



OSCFunc({|msg|
	~bass_onset_msg = msg[3];
	//~onset_button_bass.valueAction_(msg[0.);
}, "/innerOscFlow_bass_gui");



~get_bass_onset_routine = Routine({
	loop{
		~onset_button_bass.valueAction_(~bass_onset_msg);
		0.01.wait;
	}
}).play(AppClock);



~percussion_gui_track = Ndef(\amp_track_percussion_gui, {
	var data= In.kr(~percussion_peak_trig_send, 1);
	var trig= Impulse.kr(100);

	SendReply.kr(trig, "/innerOscFlow_percussion_gui", data);
});

~dabs.stop;



OSCFunc({|msg|
	~percussion_onset_msg = msg[3];
	//~onset_button_percussion.valueAction_(msg[0.);
}, "/innerOscFlow_percussion_gui");

~get_percussion_onset_routine = Routine({
	loop{
		~onset_button_percussion.valueAction_(~percussion_onset_msg);
		0.01.wait;
	}
}).play(AppClock);