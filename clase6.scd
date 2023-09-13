s.boot;


// sintes audio
// 1 cargar sonidos en un buffer
// 2 colocar la ruta donde está tu sonido para que funcione

b = Buffer.read(s, "/Users/UUAML/Downloads/sonido2.wav");

(
SynthDef(\audio, {|rate=1, sp=0, at=0.001, sus=1, rel=0.001, pan=0, amp=1, out=0|
					var son, hpf, paneo, env;
					son=PlayBuf.ar(1, b.bufnum, rate, 1, sp * b.numFrames, 0);
					hpf=HPF.ar(son, 20);
					paneo=Pan2.ar(hpf, pan, amp);
					env=EnvGen.kr(Env.new([0, 1, 1, 0], [at, sus * b.duration, rel]), doneAction: 2);
					Out.ar(out, paneo * env);
				}).add;
);

// Secuencias con sonidos

(
~son1 = Pdef(\son1, Pbind(\instrument, \audio,
	\dur, Pseq([0.25, 0.25, 0.125], inf),
	\sus, Pseq([0.40, 0.2], inf),
	\rel, Pseq([0.2, 0.9, 0.01, 0.02], inf),
	\rate, Pseq([1, 1.0, 1.5, 1, 1.5], inf),
	\sp, Pseq([0.1, 0.3, 0.9, 0.1, Pn(0.2, 4)], inf),
	\amp, 0.7
))
);

~son1.play.quant(4);
~son1.stop;

s.quit;
//Synth(\audio);