//GUI for real-time control over the SuperCollider code.

//Makes Window to house GUI objects
Window.closeAll;
w = Window("Contingencies_v1", Rect(750,50,1200,200))
.front
.alwaysOnTop_(true);

/*______________________________________________ 1. Static Text Labels for all 8 Composite Views  ______________________________________________*/


// Composite View 0 ------------------------------------------
StaticText(w, Rect(0,0,580,40))
.string_("Contingencies_v1")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 30));

// Composite View 0//////////////
StaticText(w, Rect(0,110,580,40))
.string_("Rehearsal Cues")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 30));

// Composite View 1 ------------------------------------------
StaticText(w, Rect(610,5,70,30))
.string_("Tpt: Dry")
.align_(\left)
.front
.font_(Font(size: 10));

StaticText(w, Rect(670,5,70,30))
.string_("Bass: Dry")
.align_(\left)
.front
.font_(Font(size: 10));

StaticText(w, Rect(730,5,70,30))
.string_("Perc: Dry")
.align_(\left)
.front
.font_(Font(size: 10));

StaticText(w, Rect(790,5,70,30))
.string_("Field: 1")
.align_(\left)
.front
.font_(Font(size: 10));

StaticText(w, Rect(850,5,70,30))
.string_("Field: 2")
.align_(\left)
.front
.font_(Font(size: 10));

StaticText(w, Rect(910,5,70,30))
.string_("Field: 3")
.align_(\left)
.front
.font_(Font(size: 10));

StaticText(w, Rect(970,5,70,30))
.string_("Comp")
.align_(\left)
.front
.font_(Font(size: 10));

StaticText(w, Rect(1030,5,70,30))
.string_("Tpt: OT")
.align_(\left)
.front
.font_(Font(size: 10));

StaticText(w, Rect(1090,5,70,30))
.string_("Bass: OT")
.align_(\left)
.front
.font_(Font(size: 10));

StaticText(w, Rect(1150,5,70,30))
.string_("Perc: OT")
.align_(\left)
.front
.font_(Font(size: 10));

/*______________________________________________ 2. Assign GUI objects to composite views  ______________________________________________*/

// Create Composite Views ------------------------------------------

w.view.decorator_(FlowLayout(w.bounds, 0@0, 0@0));

c = Array.fill( 2, {
	arg view;
	view = CompositeView(w, 600@200)
	.background_();

	view.decorator_(FlowLayout(view.bounds, 10@25, 70@0));
});

// Composite View 0: Init, Stop Reset, Cues ------------------------------------------
c[0].background_(Color(0, 0, 0));
c[0].decorator_(FlowLayout(c[0].bounds, 10@10, 10@10)); // Array 0
c[0].decorator.nextLine;
c[0].decorator.nextLine;
c[0].decorator.nextLine;
Array.fill(1, {Button(c[0], 200@30).font_(Font(size: 20)).states_([["Initialization", Color.black, Color.gray(0.8)],["Initialized", Color.white, Color(0,0,0)]])});

Array.fill(1, {Button(c[0], 200@30).font_(Font(size: 20)).states_([["Stop & Reset", Color.black, Color.gray(0.8)]])});

Array.fill(1, {Button(c[0], 200@30).font_(Font(size: 20)).states_([["Start", Color.black, Color.gray(0.8)]])});

Array.fill(1, {Button(c[0], 200@30).font_(Font(size: 20)).states_([["Rehearsal", Color.black, Color.gray(0.8)]])});

c[0].decorator_(FlowLayout(c[0].bounds, 25@150, 10@0)); // Array 1
c[0].decorator.nextLine;
c[0].decorator.nextLine;
Array.fill(10, {
	arg i=(-1);
	{i = i + 1};
	Button(c[0], 30@30).states_([[i.asString, Color.black, Color.gray(0.8)]])});

Array.fill(1, {Button(c[0], 30@30).states_([["F1", Color.black, Color.gray(0.8)]])});
Array.fill(1, {Button(c[0], 30@30).states_([["F2", Color.black, Color.gray(0.8)]])});
Array.fill(1, {Button(c[0], 30@30).states_([["F3", Color.black, Color.gray(0.8)]])});
Array.fill(1, {Button(c[0], 30@30).states_([["C", Color.black, Color.gray(0.8)]])});

c[0].decorator_(FlowLayout(c[0].bounds, 450@10, 10@10)); // Array 0
Array.fill(1, {Button(c[0], 100@100).font_(Font(size: 20)).states_([["Onset Test", Color.black, Color.gray(0.8)],["Off", Color.white, Color(0,0,0)]])}); //18

// Composite View 1: Audio Faders ------------------------------------------
c[1].background_(Color(1, 1, 1));


c[1].decorator_(FlowLayout(c[1].bounds, 10@30, 40@0));
Array.fill(10, {Slider(c[1], 20@150)}); //0-9
c[1].decorator_(FlowLayout(c[1].bounds, 10@180, 20@0));
Array.fill(10, {NumberBox(c[1], 40@20)}); //10-19
c[1].decorator_(FlowLayout(c[1].bounds, 10@180, 20@0));
c[1].decorator_(FlowLayout(c[1].bounds, 450@30, 40@0));
Array.fill(1, {Button(c[1], Rect(left: 200, top: 30, width: 20, height: 150)).font_(Font(size: 0)).states_([["", Color.black, Color.gray(0.8)],["", Color.white, Color(1,0,0)]])});

c[1].decorator_(FlowLayout(c[1].bounds, 510@30, 40@0)); //Arra
Array.fill(1, {Button(c[1], Rect(left: 200, top: 30, width: 20, height: 150)).font_(Font(size: 0)).states_([["", Color.black, Color.gray(0.8)],["", Color.white, Color(1,0,0)]])});

c[1].decorator_(FlowLayout(c[1].bounds, 570@30, 40@0)); //Arra
Array.fill(1, {Button(c[1], Rect(left: 200, top: 30, width: 20, height: 150)).font_(Font(size: 0)).states_([["", Color.black, Color.gray(0.8)],["", Color.white, Color(1,0,0)]])});

/*______________________________________________ 4. GUI Object Functionality  ______________________________________________*/

~init_button = c[0].children[0]
.action_({
	arg obj;
	if(obj.value == 1, {e[\init].value;"init".postln},{nil});
});

~onset_button = c[0].children[18]
.action_({
	arg obj;
	if(obj.value == 1, {e[\onset_test].value;"init".postln},{e[\onset_test_off].value});
});

~stop_button = c[0].children[1]
.mouseDownAction_({e[\stop_reset].value})

.mouseUpAction_({~init_button.valueAction = 0});

~next_cue_button = c[0].children[2]
.mouseDownAction_({e[\start].value});

~rehearsal_button = c[0].children[3]
.mouseDownAction_({e[\rehearsal_mode].value});

~rehearsal_cue_button_0 = c[0].children[4]
.mouseDownAction_({
	~cue=0;
});

~rehearsal_cue_button_1 = c[0].children[5]
.mouseDownAction_({
	~cue=1;
});

~rehearsal_cue_button_2 = c[0].children[6]
.mouseDownAction_({
	~cue=2;
});

~rehearsal_cue_button_3 = c[0].children[7]
.mouseDownAction_({
	~cue=3;
});

~rehearsal_cue_button_4 = c[0].children[8]
.mouseDownAction_({
	~cue=4;
});

~rehearsal_cue_button_5 = c[0].children[9]
.mouseDownAction_({
	~cue=5;
});

~rehearsal_cue_button_6 = c[0].children[10]
.mouseDownAction_({
	~cue=6;
});

~rehearsal_cue_button_7 = c[0].children[11]
.mouseDownAction_({
	~cue=7;
});


~rehearsal_cue_button_8 = c[0].children[12]
.mouseDownAction_({
	~cue=8;
});

~rehearsal_cue_button_9 = c[0].children[13]
.mouseDownAction_({
	~cue=9;
});

~rehearsal_cue_button_10 = c[0].children[14] //field 1
.mouseDownAction_({
	~cue=15;
});

~rehearsal_cue_button_11 = c[0].children[15] //field 2
.mouseDownAction_({
	~cue=16;
});

~rehearsal_cue_button_12 = c[0].children[16] //field 3
.mouseDownAction_({
	~cue=17;
});

~rehearsal_cue_button_12 = c[0].children[17] //computer solo
.mouseDownAction_({
	~cue=13;
});

//GUI FUNC: 0
~onset_button_trumpet = c[1].children[20];
~onset_button_bass = c[1].children[21];
~onset_button_percussion = c[1].children[22];

//GUI FUNC: 0
~trumpet_onset_slider = c[1].children[7].action_({
	arg obj;
	var thresh;
	thresh = obj.value.linlin(0.0, 1.0, 0.0, 0.8);
	~trumpet_onset_thesh_init = obj.value.linlin(0.0, 1.0, 0.0, 0.8);
	if(~trumpet_fx_9.isPlaying,
		{~trumpet_fx_9.set(\thresh, thresh)}
	);
	if(~trumpet_amp_tracking.isPlaying,
		{~trumpet_amp_tracking.set(\thresh, thresh)}
	);
	~trumpet_onset_numBox.value_(obj.value.linlin(0.0, 1.0, 0.0, 0.8)); // updates numberbox with freq information.
});

~trumpet_onset_numBox = c[1].children[17]
.decimals_(3)
.clipLo_(0)
.clipHi_(0.8)
.action_({
	arg obj;
	~trumpet_onset_slider.valueAction_(obj.value.linlin(0.0,0.8, 0.0,1.0)) // allows you to move slider via typing numbers
});

~bass_onset_slider = c[1].children[8].action_({
	arg obj;
	var thresh;
	thresh = obj.value.linlin(0.0, 1.0, 0.0, 0.8);
	~bass_onset_thesh_init = obj.value.linlin(0.0, 1.0, 0.0, 0.8);
	if(~bass_fx_9.isPlaying,
		{~bass_fx_9.set(\thresh, thresh)}
	);
	if(~bass_amp_tracking.isPlaying,
		{~bass_amp_tracking.set(\thresh, thresh)}
	);
	~bass_onset_numBox.value_(obj.value.linlin(0.0, 1.0, 0.0, 0.8)); // updates numberbox with freq information.
});

~bass_onset_numBox = c[1].children[18]
.decimals_(3)
.clipLo_(0)
.clipHi_(0.8)
.action_({
	arg obj;
	~bass_onset_slider.valueAction_(obj.value.linlin(0.0,0.8, 0.0,1.0)) // allows you to move slider via typing numbers
});

~percussion_onset_slider = c[1].children[9].action_({
	arg obj;
	var thresh;
	thresh = obj.value.linlin(0.0, 1.0, 0.0, 0.8);
	~percussion_onset_thesh_init = obj.value.linlin(0.0, 1.0, 0.0, 0.8);
	if(~percussion_fx_9.isPlaying,
		{~percussion_fx_9.set(\thresh, thresh)}
	);
	if(~percussion_amp_tracking.isPlaying,
		{~percussion_amp_tracking.set(\thresh, thresh)}
	);
	~percussion_onset_numBox.value_(obj.value.linlin(0.0, 1.0, 0.0, 0.8)); // updates numberbox with freq information.
});

~percussion_onset_numBox = c[1].children[19]
.decimals_(3)
.clipLo_(0)
.clipHi_(0.8)
.action_({
	arg obj;
	~percussion_onset_slider.valueAction_(obj.value.linlin(0.0,0.8, 0.0,1.0)) // allows you to move slider via typing numbers
});

