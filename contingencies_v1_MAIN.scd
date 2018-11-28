(
/*______________________________________________ DO NOT ALTER ANY CODE BELOW THIS LINE ______________________________________________*/
/*_______________________________________________________________________________________________________________________________________________________________________________*/


/*______________________________________________ 1. Server Configuration ______________________________________________*/
s = Server.local;
s.newBusAllocators;
s.latency = 0.05;
ServerBoot.removeAll;
ServerTree.removeAll;
ServerQuit.removeAll;
Server.local.options.numOutputBusChannels = 8;
Server.local.options.numInputBusChannels = 8;
o=s.options;
o.memSize;
o.memSize = 2.pow(20);

/*______________________________________________ 2. Global Variables/Arrays ______________________________________________*/

~host = NetAddr("localhost", 4859);

~path = PathName(thisProcess.nowExecutingPath).parentPath++"buffers/";

~buffers_path = PathName(thisProcess.nowExecutingPath).parentPath++"buffers/";
~synth_def_path = PathName(thisProcess.nowExecutingPath).parentPath++"synth_defs/";
~init_path = PathName(thisProcess.nowExecutingPath).parentPath++"init/";
~events_path = PathName(thisProcess.nowExecutingPath).parentPath++"events/";

~index = 0;
~rehearsal_mode = 0;
~no_input_index = 0;
~trumpet_in = 0;
~bass_in = 1;
~bass_contact= 2;
~oh_l = 3;
~oh_r = 4;
~kick_in = 5;
~snare_in = 6;
~hat_in = 7;
~trumpet_contact_in = 8;
~bass_contact_in = 9;
~trumpet_out=0;
~bass_out = 1;
~percussion_out = 2;
~trumpet_out=0;
~computer_out = 1;

//Make Arrays for ntube processing
thisProcess.interpreter.executeFile(~init_path++"make_arrays.scd");

/*______________________________________________ 3. Buffers ______________________________________________*/
~makeBuffers = {
thisProcess.interpreter.executeFile(~init_path++"make_buffers.scd");
};

/*______________________________________________ 4. Nodes ______________________________________________*/
~makeNodes = {
thisProcess.interpreter.executeFile(~init_path++"make_nodes.scd");
};

/*______________________________________________ 5. MIDI ______________________________________________*/
~makeMIDI = {
thisProcess.interpreter.executeFile(~init_path++"make_midi.scd");
};

/*______________________________________________ 6. Events/Arrays ______________________________________________*/
~makeEvents = {

e = Dictionary.new;

/*______________________________________________ 6a. Macro Controls ______________________________________________*/

e.add(\init -> {
thisProcess.interpreter.executeFile(~init_path++"init_trio.scd");
});

e.add(\start -> {
thisProcess.interpreter.executeFile(~events_path++"start_trio.scd");
});

e.add(\onset_test -> {
thisProcess.interpreter.executeFile(~events_path++"onset_test.scd");
});

e.add(\onset_test_off -> {
thisProcess.interpreter.executeFile(~events_path++"onset_test_off.scd");
});

e.add(\rehearsal_mode -> {
thisProcess.interpreter.executeFile(~events_path++"rehearsal_mode_trio.scd");
});

e.add(\stop_reset -> {
thisProcess.interpreter.executeFile(~events_path++"start_stop_trio.scd");
});

e.add(\kill_synths_0 -> {
thisProcess.interpreter.executeFile(~events_path++"kill_synths_0.scd");
});

e.add(\kill_synths_1 -> {
thisProcess.interpreter.executeFile(~events_path++"kill_synths_1.scd");
});

e.add(\kill_synths_2 -> {
thisProcess.interpreter.executeFile(~events_path++"kill_synths_2.scd");
});

e.add(\kill_synths_3 -> {
thisProcess.interpreter.executeFile(~events_path++"kill_synths_3.scd");
});

e.add(\kill_synths_4 -> {
thisProcess.interpreter.executeFile(~events_path++"kill_synths_4.scd");
});

e.add(\kill_synths_5 -> {
thisProcess.interpreter.executeFile(~events_path++"kill_synths_5.scd");
});

e.add(\kill_synths_6 -> {
thisProcess.interpreter.executeFile(~events_path++"kill_synths_6.scd");
});

e.add(\kill_synths_7 -> {
thisProcess.interpreter.executeFile(~events_path++"kill_synths_7.scd");
});

e.add(\kill_synths_8 -> {
thisProcess.interpreter.executeFile(~events_path++"kill_synths_8.scd");
});

e.add(\kill_synths_9 -> {
thisProcess.interpreter.executeFile(~events_path++"kill_synths_9.scd");
});

/*______________________________________________ 6b. Module Events ______________________________________________*/

e.add(\0 -> {
thisProcess.interpreter.executeFile(~events_path++"event_0.scd");
});

e.add(\1 -> {
thisProcess.interpreter.executeFile(~events_path++"event_1.scd");
});

e.add(\2 -> {
thisProcess.interpreter.executeFile(~events_path++"event_2.scd");
});

e.add(\3 -> {
thisProcess.interpreter.executeFile(~events_path++"event_3.scd");
});

e.add(\4 -> {
thisProcess.interpreter.executeFile(~events_path++"event_4.scd");
});

e.add(\5 -> {
thisProcess.interpreter.executeFile(~events_path++"event_5.scd");
});

e.add(\6 -> {
thisProcess.interpreter.executeFile(~events_path++"event_6.scd");
});

e.add(\7 -> {
thisProcess.interpreter.executeFile(~events_path++"event_7.scd");
});

e.add(\8 -> {
thisProcess.interpreter.executeFile(~events_path++"event_8.scd");
});

e.add(\9 -> {
thisProcess.interpreter.executeFile(~events_path++"event_9.scd");
});

/*______________________________________________ 6c. Solo Events ______________________________________________*/

e.add(\10 -> {
thisProcess.interpreter.executeFile(~events_path++"trumpet_solo.scd");
});

e.add(\11 -> {
thisProcess.interpreter.executeFile(~events_path++"bass_solo.scd");
});

e.add(\12 -> {
thisProcess.interpreter.executeFile(~events_path++"percussion_solo.scd");
});

e.add(\13 -> {
thisProcess.interpreter.executeFile(~events_path++"computer_solo.scd");
});

e.add(\14 -> {
thisProcess.interpreter.executeFile(~events_path++"all_solo.scd");
});

e.add(\15-> {
thisProcess.interpreter.executeFile(~events_path++"field_recording_1.scd");
});

e.add(\16-> {
thisProcess.interpreter.executeFile(~events_path++"field_recording_2.scd");
});

e.add(\17-> {
thisProcess.interpreter.executeFile(~events_path++"field_recording_3.scd");
});

e.add(\18-> {
thisProcess.interpreter.executeFile(~events_path++"end_piece.scd");
});

e.add(\19-> {
if(~index < 12, {~array = ~array.put(~index+1, ~cue)}, {nil});
});
};

/*______________________________________________ 7. GUI ______________________________________________*/
~makeGui = {
thisProcess.interpreter.executeFile(~init_path++"make_gui.scd");
};

/*______________________________________________ 8. Cleanup ______________________________________________*/

~cleanup = {
	s.newBusAllocators;
	ServerBoot.removeAll;
	ServerTree.removeAll;
	ServerQuit.removeAll;
};

ServerBoot.add(~makeGui);
ServerBoot.add(~makeBuffers);
ServerQuit.add(~cleanup);

/*______________________________________________ 9. Busses & SynthDefs ______________________________________________*/

s.waitForBoot({

	thisProcess.interpreter.executeFile(~init_path++"make_busses.scd");

    s.sync;

	PathName(~synth_def_path).entries.size.do{

		arg count=0;

		thisProcess.interpreter.executeFile(~synth_def_path++PathName(~synth_def_path).entries.at(count).fileName.asString);

		count = count + 1;
	};

    s.sync;

    ServerTree.add(~makeNodes);
	ServerTree.add(~makeMIDI);
	ServerTree.add(~makeEvents);
	s.freeAll;
	s.sync;
	s.meter;
	"done".postln;
});
)
