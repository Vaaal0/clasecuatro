// Creación audiovisual con lenguajes de programación sesión 3

// prendemos supercollider
s.boot;

(
SynthDef(\misinte, {|frec=960 amp=0.4|
	var sen, env;
	sen=SinOsc.ar(frec, 0, amp);
	env=EnvGen.kr(Env.new([1,0,0],[0.1,0.0]),doneAction:2);
	Out.ar(0, sen*env)
}).add
);

// Llamar a un SynthDef
a=Synth(\misinte,[\frec, rrand(550,780)]);



// Envolventes

Env.new([0,3,0.5,0.2, 3],[0.1,0.1,0.1,0.5]).plot;
.3
(
~sec1=Pdef(\sec,
	Pbind(\instrument, \misinte,
		\dur, Pseq([0.55, 0.37, 0.172, inf),
		\frec, Pseq([140, 200,6550],inf),
		\amp, 1
	)
);
)

~sec1.play;
~sec1.stop;












