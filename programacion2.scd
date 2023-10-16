
(
~sec1 = Pdef(\sec, Pbind(\instrument, \pulse,
	\dur, Pseq([0.5, 0.25, 0.25, Pn(0.125, 4), 1], inf),
	\amp, 0.12,
	\freq, Pseq([350, 400, 900, 790, Pn(370, 4), Pseq([400, 900, 400, 450], 3)], inf),
	\rel, 0.10,
	\out, 11
))
);

(
~sec3 = Pdef(\sec3, Pbind(\instrument, \wnoise,
	\dur, 0.125,
	\amp, Pseq([0.03, 0.06, 0.20, 0.01, 0.03, 0.09, 0.15, 0.01, Pseq([0.1, 0.14, 0.01, 0.17], 2.5)], inf),
	\at, 0.001, \rel, 0.1,
	\out, 17
))
);

(
~sec4 = Pdef(\sec4, Pbind(\instrument, \sine,
	\dur, 0.5,
	\amp, 0.8,
	\freq, 270,
	\at, 0.01, \rel, 0.01,
	\out, 0
))
);

(
~sec5 = Pdef(\sec5, Pbind(\instrument, \sine,
	\dur, 0.5,
	\amp, 0.7,
	\freq, 200,
	\at, 0.05, \rel, 0.02,
	\out, 0
))
);

~sec1.play.quant(4);
~sec3.play.quant(4);
~sec4.play.quant(4);
~sec5.play.quant(4);

~rev.set(\mix, 0.5, \room, 0.5, \damp, 0.5);

~sec1.stop;
~sec3.stop;
~sec4.stop;
~sec5.stop;