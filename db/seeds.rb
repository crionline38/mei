
User.destroy_all
Function.destroy_all

fadh = Function.create({name: "Adhérent"})
fprof = Function.create({name: "Professeur"})
fbur = Function.create({name: "Bureau"})
fsec = Function.create({name: "Secrétaire"})
ftres = Function.create({name: "Trésorier"})
fpre = Function.create({name: "Président"})
fadmin = Function.create({name: "Admin"})

Frequence.destroy_all
hebdo = Frequence.create({name: "Hebdo"})
bi = Frequence.create({name: "Bi-mensuel"})
aucun = Frequence.create({name: "Aucune"})

Tarif.destroy_all
eveil = Tarif.create({name: "Eveil musical (5/6 ans)", a: 145, b: 145, c: 145, valide: true })
instrument = Tarif.create({name: "Instrument + FM", a: 565, b: 535, c: 460, valide: true })
batterie = Tarif.create({name: "Batterie", a: 525, b: 495, c: 460, valide: true })
techind = Tarif.create({name: "Technique voc. cours ind.", a: 565, b: 535, valide: true })
techcol = Tarif.create({name: "Technique voc. cours col.", a: 220, b: 220, valide: true })
atelier = Tarif.create({name: "Atelier", a: 150, b: 150, c: 150, valide: true })
zero = Tarif.create({name: "Formation Musicale"})

Discipline.destroy_all
em = Discipline.create({name: "Eveil musical (5/6 ans)",
                               duree:"30", frequence: hebdo,
                               tarif: eveil,
                               valide: true, fm: false})
instru = Discipline.create({name: "Instrument + FM hebdomadaire",
                               duree:"30", frequence: hebdo,
                               tarif: instrument,
                               valide: true, fm: true})
instrub = Discipline.create({name: "Instrument + FM bimensuel",
                               duree:"60", frequence: bi,
                               tarif: instrument,
                               valide: true, fm: true})
bat = Discipline.create({name: "Batterie",
                               duree:"30", frequence: hebdo,
                               tarif: batterie,
                               valide: true, fm: false})
voci = Discipline.create({name: "Technique vocale Individuel",
                               duree:"60", frequence: bi,
                               tarif: techind,
                               valide: true, fm: false})
vocc = Discipline.create({name: "Technique vocale collectif",
                               duree:"120", frequence: bi,
                               tarif: techcol,
                               valide: true, fm: false})
fm = Discipline.create({name: "Formation musicale",
                               duree:"60", frequence: hebdo,
                               tarif: zero,
                               valide: true, fm: false})
atelier = Discipline.create({name: "Atelier",
                               duree:"60", frequence: aucun,
                               tarif: atelier,
                               valide: true, fm: false})

Instrument.destroy_all
evm = Instrument.create({name: "Eveil musical (5/6 ans)",valide: true})
gm = Instrument.create({name: "Guitare moderne",valide: true})
gc = Instrument.create({name: "Guitare classique",valide: true})
pm = Instrument.create({name: "Piano moderne",valide: true})
pc = Instrument.create({name: "Piano classique",valide: true})
sax = Instrument.create({name: "Saxophone",valide: true})
drums = Instrument.create({name: "Batterie",valide: true})
chant = Instrument.create({name: "Chant",valide: true})

Instrud.destroy_all
Instrud.create({instrument: evm, discipline: em})

Instrud.create({instrument: gm, discipline: instru})
Instrud.create({instrument: gc, discipline: instru})
Instrud.create({instrument: pm, discipline: instru})
Instrud.create({instrument: pc, discipline: instru})
Instrud.create({instrument: sax, discipline: instru})

Instrud.create({instrument: gm, discipline: instrub})
Instrud.create({instrument: gc, discipline: instrub})
Instrud.create({instrument: pm, discipline: instrub})
Instrud.create({instrument: pc, discipline: instrub})
Instrud.create({instrument: sax, discipline: instrub})

Instrud.create({instrument: drums, discipline: bat})
Instrud.create({instrument: chant, discipline: voci})
Instrud.create({instrument: chant, discipline: vocc})

Instrud.create({instrument: gm, discipline: atelier})
Instrud.create({instrument: gc, discipline: atelier})
Instrud.create({instrument: pm, discipline: atelier})
Instrud.create({instrument: pc, discipline: atelier})
Instrud.create({instrument: sax, discipline: atelier})
Instrud.create({instrument: drums, discipline: atelier})
Instrud.create({instrument: chant, discipline: atelier})

Year.destroy_all
y16 = Year.create({name: "2015/2016", valide: true})
y17 = Year.create({name: "2016/2017", valide: true})
y18 = Year.create({name: "2017/2018", valide: true})
