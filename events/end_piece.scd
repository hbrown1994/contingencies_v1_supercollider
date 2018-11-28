Routine({

	~cue = 18;

	//ZERO
	if(~noise_1.isPlaying, {~noise_1.set(\gate, 0)},{nil});
	if(~buzz_1.isPlaying, {~buzz_1.set(\gate, 0)},{nil});
	if(~noise_2.isPlaying, {~noise_2.set(\gate, 0)},{nil});
	if(~noise_3.isPlaying, {~noise_3.set(\gate, 0)},{nil});

	if(~noise_3.isPlaying, {~noise_3.set(\gate, 0)},{nil});
	if(~noise_4.isPlaying, {~noise_4.set(\gate, 0)},{nil});
	if(~noise_5.isPlaying, {~noise_5.set(\gate, 0)},{nil});
	if(~high_tone_1.isPlaying, {~high_tone_1.set(\gate, 0)},{nil});

	if(~trumpet_fx_0_1.isPlaying, {~trumpet_fx_0_1.set(\gate, 0)},{nil});
	if(~percussion_fx_0_1.isPlaying, {~percussion_fx_0_1.set(\gate, 0)},{nil});
	if(~bass_fx_0_1.isPlaying, {~bass_fx_0_1.set(\gate, 0)},{nil});

	if(~bass_fx_0_2.isPlaying, {~bass_fx_0_2.set(\gate, 0)},{nil});
	if(~trumpet_fx_0_2.isPlaying, {~trumpet_fx_0_2.set(\gate, 0)},{nil});
	if(~percussion_fx_0_2.isPlaying, {~percussion_fx_0_2.set(\gate, 0)},{nil});

	if(~bass_fx_0_3.isPlaying, {~bass_fx_0_3.set(\gate, 0)},{nil});
	if(~bass_fx_0_4.isPlaying, {~bass_fx_0_4.set(\gate, 0)},{nil});

	if(~greyhole_0.isPlaying, {~greyhole_0.set(\gate, 0)},{nil});
	if(~input_sum_0.isPlaying, {~input_sum_0.set(\gate, 0)},{nil});

	if(~bass_sampling_loop_0.isPlaying, {~bass_sampling_loop_0.stop},{nil});
	if(~zero_bass_stream.isPlaying, {~zero_bass_stream.stop},{nil});

	//ONE
	if(~input_sum.isPlaying, {~input_sum.set(\gate, 0)},{nil});
	if(~group_fx_1.isPlaying, {~group_fx_1.set(\gate, 0)},{nil});
	if(~one_sample_stream.isPlaying, {~one_sample_stream.stop},{nil});

	if(~trumpet_fx_1.isPlaying, {~trumpet_fx_1.set(\gate, 0)},{nil});
	if(~bass_fx_1_1.isPlaying, {~bass_fx_1_1.set(\gate, 0)},{nil});
	if(~bass_fx_1_2.isPlaying, {~bass_fx_1_2.set(\gate, 0)},{nil});
	if(~percussion_fx_1.isPlaying, {~percussion_fx_1.set(\gate, 0)},{nil});

	if(~bass_sampling_loop_1.isPlaying, {~bass_sampling_loop_1.stop},{nil});
	if(~one_bass_stream.isPlaying, {~one_bass_stream.stop},{nil});

	//TWO
	if(~trumpet_feedback_1.isPlaying, {~trumpet_feedback_1.set(\gate, 0)},{nil});
	if(~bass_feedback_1.isPlaying, {~bass_feedback_1.set(\gate, 0)},{nil});

	if(~trumpet_fx_2.isPlaying, {~trumpet_fx_2.set(\gate, 0, \rel, [10, 15, 20].choose)},{nil});
	if(~bass_fx_2.isPlaying, {~bass_fx_2.set(\gate, 0, \rel, [10, 15, 20].choose)},{nil});
	if(~percussion_fx_2.isPlaying, {~percussion_fx_2.set(\gate, 0, \rel, [10, 15, 20].choose)},{nil});


	//THREE
	if(~glitch_1.isPlaying, {~glitch_1.set(\gate, 0)},{nil});
	if(~asmr_1.isPlaying, {~asmr_1.set(\gate, 0)},{nil});
	if(~noise_1.isPlaying, {~noise_1.set(\gate, 0)},{nil});
	if(~glitch_1.isPlaying, {~glitch_1.set(\gate, 0)},{nil});
	if(~high_sine_1.isPlaying, {~high_sine_1.set(\gate, 0)},{nil});


	if(~percussion_fx_3_1.isPlaying, {~percussion_fx_3_1.set(\gate, 0)},{nil});
	if(~percussion_fx_3_2.isPlaying, {~percussion_fx_3_2.set(\gate, 0)},{nil});

	if(~percussion_sampling_loop_3.isPlaying, {~percussion_sampling_loop_3.stop},{nil});
	if(~three_percussion_stream.isPlaying, {~three_percussion_stream.stop},{nil});

	if(~bass_sampling_loop_3.isPlaying, {~bass_sampling_loop_3.stop},{nil});
	if(~bass_fx_3_3.isPlaying, {~bass_fx_3_3.set(\gate, 0)},{nil});
	if(~three_bass_stream.isPlaying, {~three_bass_stream.stop},{nil});
	if(~bass_fx_3_2.isPlaying, {~bass_fx_3_2.set(\gate, 0)},{nil});

	if(~percussion_fx_3.isPlaying, {~percussion_fx_3.set(\gate, 0)},{nil});
	if(~trumpet_fx_3_1.isPlaying, {~trumpet_fx_3_1.set(\gate, 0)},{nil});
	if(~bass_fx_3_1.isPlaying, {~bass_fx_3_1.set(\gate, 0)},{nil});

	if(~trumpet_fx_3.isPlaying, {~trumpet_fx_3.set(\gate, 0, \rel, 20)},{nil});

	//FOUR
	if(~pulse_1.isPlaying, {~pulse_1.set(\gate, 0, \rel, 10)},{nil});
	if(~pulse_3.isPlaying, {~pulse_3.set(\gate, 0, \rel, 10)},{nil});
	if(~sub.isPlaying, {~sub.set(\gate, 0)},{nil});
	if(~pulse_2.isPlaying, {~pulse_2.set(\gate, 0, \rel, 10)},{nil});
	if(~drums_1.isPlaying, {~drums_1.set(\gate, 0)},{nil});
	if(~glitch_1.isPlaying, {~glitch_1.set(\gate, 0)},{nil});


	if(~trumpet_fx_4.isPlaying, {~trumpet_fx_4.set(\gate, 0, \rel, 20)},{nil});
	if(~percussion_fx_4.isPlaying, {~percussion_fx_4.set(\gate, 0, \rel, 20)},{nil});
	if(~bass_fx_4.isPlaying, {~bass_fx_4.set(\gate, 0, \rel, 20)},{nil});

	if(~trumpet_fx_4_1.isPlaying, {~trumpet_fx_4_1.set(\gate, 0, \rel, 20)},{nil});
	if(~percussion_fx_4_1.isPlaying, {~percussion_fx_4_1.set(\gate, 0, \rel, 0.05)},{nil});

	if(~trumpet_fx_4_2.isPlaying, {~trumpet_fx_4_2.set(\gate, 0, \rel, 0.05)},{nil});
	if(~bass_fx_4_2.isPlaying, {~bass_fx_4_2.set(\gate, 0, \rel, 0.05)},{nil});
	if(~percussion_4_fx_2.isPlaying, {~percussion_4_fx_2.set(\gate, 0, \rel, 0.05)},{nil});

	if(~input_sum_4.isPlaying, {~input_sum_4.set(\gate, 0, \rel, 20)},{nil});
	if(~greyhole_4.isPlaying, {~greyhole_4.set(\gate, 0, \rel, 20)},{nil});

	//FIVE
	if(~sub.isPlaying, {~sub.set(\gate, 0)},{nil});

	if(~trumpet_noise_1.isPlaying, {~trumpet_noise_1.set(\gate, 0)},{nil});

	if(~trumpet_feedback_2.isPlaying, {~trumpet_feedback_2.set(\gate, 0)},{nil});
	if(~bass_feedback_2.isPlaying, {~bass_feedback_2.set(\gate, 0)},{nil});

	if(~five_sample_stream.isPlaying, {~five_sample_stream.stop}, {nil});

	if(~trumpet_feedback_2.isPlaying, {~bass_feedback_2.set(\gate, 0)},{nil});
	if(~bass_feedback_.isPlaying, {~bass_feedback_2.set(\gate, 0)},{nil});

	if(~bass_fx_5.isPlaying, {~bass_fx_5.set(\gate, 0)},{nil});

	if(~trumpet_fx_5.isPlaying, {~trumpet_fx_5.set(\gate, 0)},{nil});
	if(~trumpet_fx_5_1.isPlaying, {~trumpet_fx_5_1.set(\gate, 0)},{nil});
	if(~trumpet_fx_5_2.isPlaying, {~trumpet_fx_5_2.set(\gate, 0)},{nil});
	if(~trumpet_fx_5_3.isPlaying, {~trumpet_fx_5_3.set(\gate, 0)},{nil});

	//SIX
	if(~soft_noise_1.isPlaying, {~soft_noise_1.set(\gate, 0)},{nil});

	//SEVEN
	if(~greyhole_7.isPlaying, {~greyhole_7.set(\gate, 0)},{nil});
	if(~input_sum_7.isPlaying, {~input_sum_7.set(\gate, 0)},{nil});

	if(~drone_1.isPlaying, {~drone_1.set(\gate, 0)},{nil});
	if(~drone_1_1.isPlaying, {~drone_1_1.set(\gate, 0)},{nil});

	//EIGHT
	if(~percussion_fx_8.isPlaying, {~percussion_fx_8.set(\gate, 0)},{nil});
	if(~trumpet_fx_8.isPlaying, {~trumpet_fx_8.set(\gate, 0)},{nil});
	if(~bass_fx_8_contact.isPlaying, {~bass_fx_8_contact.set(\gate, 0)},{nil});
	if(~bass_fx_8.isPlaying, {~bass_fx_8.set(\gate, 0)},{nil});
	if(~drone_1.isPlaying, {~drone_1.set(\gate, 0)},{nil});
	if(~noise_1.isPlaying, {~noise_1.set(\gate, 0)},{nil});

	//NINE
	if(~trumpet_fx_9.isPlaying, {~trumpet_fx_9.set(\gate, 0)},{nil});
	if(~bass_fx_9.isPlaying, {~bass_fx_9.set(\gate, 0)},{nil});
	if(~percussion_fx_9.isPlaying, {~percussion_fx_9.set(\gate, 0)},{nil});

	//Computer solo
	if(~computer_solo_stream.isPlaying, {~computer_solo_stream.stop},{nil});

	//field_recordings

	if(~field_recording_1.isPlaying, {~field_recording_1.set(\gate, 0)},{nil});
	if(~field_recording_2.isPlaying, {~field_recording_2.set(\gate, 0)},{nil});
	if(~field_recording_3_l.isPlaying, {~field_recording_3_l.set(\gate, 0)},{nil});
	if(~field_recording_3_r.isPlaying, {~field_recording_3_r.set(\gate, 0)},{nil});


	//feedback
	if(~trumpet_feedback.isPlaying, {~trumpet_feedback.set(\gate, 0)},{nil});
	if(~bass_feedback.isPlaying, {~bass_feedback.set(\gate, 0)},{nil});



	~zero_samples_routine.stop;
	~one_samples_routine.stop;
	~two_samples_routine.stop;
	~three_samples_routine.stop;
	~four_samples_routine.stop;
	~five_samples_routine.stop;
	~six_samples_routine.stop;
	~seven_samples_routin.stop;
	~eight_samples_routine.stop;
	~nine_fx_routine.stop;
	~zero_fx_routine.stop;
	~one_fx_routine.stop;
	~two_fx_routine.stop;
	~three_fx_routine.stop;
	~four_fx_routine.stop;
	~five_fx_routine.stop;
	~six_fx_routine.stop;
	~seven_fx_routin.stop;
	~eight_fx_routine.stop;
	~nine_fx_routine.stop;
	~trumpet_solo_routine.stop;
	~bass_solo_routine.stop;
	~percussion_solo_routine.stop;
	~computer_solo.stop;
	~all_solo.stop;
	~field_recording_1_routine.stop;
	~field_recording_2_routine.stop;

	//kill record routine
	~zero_record_routine.stop;

	1.wait;

	~clock.free;

}).play(SystemClock);