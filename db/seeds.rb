
User.destroy_all
Function.destroy_all

function = Function.create({name: "Adhérent"})
function = Function.create({name: "Professeur"})
function = Function.create({name: "Bureau"})
function = Function.create({name: "Secrétaire"})
function = Function.create({name: "Trésorier"})
function = Function.create({name: "Président"})
function = Function.create({name: "Admin"})

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
discipline = Discipline.create({name: "Eveil musical (5/6 ans)",
                               duree:"30", frequence: hebdo,
                               tarif: eveil,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Guitare moderne",
                               duree:"30", frequence: hebdo,
                               tarif: instrument,
                               valide: true, fm: true})
discipline = Discipline.create({name: "Guitare classique",
                               duree:"30", frequence: hebdo,
                               tarif: instrument,
                               valide: true, fm: true})
discipline = Discipline.create({name: "Piano moderne",
                               duree:"30", frequence: hebdo,
                               tarif: instrument,
                               valide: true, fm: true})
discipline = Discipline.create({name: "Piano classique",
                               duree:"30", frequence: hebdo,
                               tarif: instrument,
                               valide: true, fm: true})
discipline = Discipline.create({name: "Saxophone",
                               duree:"30", frequence: hebdo,
                               tarif: instrument,
                               valide: true, fm: true})
discipline = Discipline.create({name: "Batterie",
                               duree:"30", frequence: hebdo,
                               tarif: batterie,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Technique vocale Individuel",
                               duree:"60", frequence: bi,
                               tarif: techind,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Technique vocale collectif",
                               duree:"120", frequence: bi,
                               tarif: techcol,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Formation musicale",
                               duree:"60", frequence: hebdo,
                               tarif: zero,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Atelier",
                               duree:"60", frequence: aucun,
                               tarif: atelier,
                               valide: true, fm: false})
