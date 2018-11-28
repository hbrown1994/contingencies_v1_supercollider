//Create node groups on server.
s.bind({

	~samples = Group.new;
	~patterns = Group.after(~samples);
	~input = Group.after(~patterns);
	~input_sum = Group.after(~input);
	~amp_tracking = Group.after(~input_sum);

	~zero_fx_node = Group.after(~amp_tracking);
	~zero_samples_node = Group.after(~zero_fx_node);

	~one_fx_node = Group.after(~zero_samples_node);
	~one_samples_node = Group.after(~one_fx_node);

	~two_fx_node = Group.after(~one_samples_node);
	~two_samples_node = Group.after(~two_fx_node);

	~three_fx_node = Group.after(~two_samples_node);
	~three_samples_node = Group.after(~three_fx_node);

	~four_fx_node = Group.after(~three_samples_node);
	~four_samples_node = Group.after(~four_fx_node);

	~five_fx_node = Group.after(~four_samples_node);
	~five_samples_node = Group.after(~five_fx_node);

	~six_fx_node = Group.after(~five_samples_node);
	~six_samples_node = Group.after(~six_fx_node);

	~seven_fx_node = Group.after(~six_samples_node);
	~seven_samples_node = Group.after(~seven_fx_node);

	~eight_fx_node = Group.after(~seven_samples_node);
	~eight_samples_node = Group.after(~eight_fx_node);

	~nine_fx_node = Group.after(~eight_samples_node);
	~nine_samples_node = Group.after(~nine_fx_node);

	~trumpet_solo_node = Group.after(~nine_samples_node);
	~bass_solo_node = Group.after(~trumpet_solo_node);
	~percussion_solo_node = Group.after(~bass_solo_node);

	~field_recording_node = Group.after(~percussion_solo_node);

});