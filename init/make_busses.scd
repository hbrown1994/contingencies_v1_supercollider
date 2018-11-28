//Make routing busses

//Control busses
~osc_bus = Bus.control(s, 1);
~routine_trig = Bus.control(s, 1);

~a_key_bus = Bus.control(s, 1);
~b_key_bus = Bus.control(s, 1);

~trumpet_peak_send = Bus.control(s, 1);
~trumpet_rms_send = Bus.control(s, 1);
~trumpet_peak_trig_send = Bus.control(s, 1);

~bass_peak_send = Bus.control(s, 1);
~bass_rms_send = Bus.control(s, 1);
~bass_peak_trig_send = Bus.control(s, 1);

~percussion_peak_send = Bus.control(s, 1);
~percussion_rms_send = Bus.control(s, 1);
~percussion_peak_trig_send = Bus.control(s, 1);

//Audio Busses
~kick_send = Bus.audio(s, 1);
~snare_send = Bus.audio(s, 1);
~oh_send= Bus.audio(s, 1);
~hat_send = Bus.audio(s, 1);
~percussion_send = Bus.audio(s, 1);
~bass_send = Bus.audio(s, 1);
~bass_contact_send = Bus.audio(s, 1);
~trumpet_send = Bus.audio(s, 1);
~trumpet_contact_send = Bus.audio(s, 1);
~input_sum_send = Bus.audio(s, 1);
~ntube_send = Bus.audio(s, 1);


