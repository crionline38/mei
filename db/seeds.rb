
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

Discipline.destroy_all
discipline = Discipline.create({name: "Eveil musical (5/6 ans)",
                               duree:"30", frequence: hebdo,
                               tarif1: 145, tarif2: 145, tarif3: 145,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Guitare moderne",
                               duree:"30", frequence: hebdo,
                               tarif1: 460, tarif2: 535, tarif3: 565,
                               valide: true, fm: true})
discipline = Discipline.create({name: "Guitare classique",
                               duree:"30", frequence: hebdo,
                               tarif1: 460, tarif2: 535, tarif3: 565,
                               valide: true, fm: true})
discipline = Discipline.create({name: "Piano moderne",
                               duree:"30", frequence: hebdo,
                               tarif1: 460, tarif2: 535, tarif3: 565,
                               valide: true, fm: true})
discipline = Discipline.create({name: "Piano classique",
                               duree:"30", frequence: hebdo,
                               tarif1: 460, tarif2: 535, tarif3: 565,
                               valide: true, fm: true})
discipline = Discipline.create({name: "Saxophone",
                               duree:"30", frequence: hebdo,
                               tarif1: 460, tarif2: 535, tarif3: 565,
                               valide: true, fm: true})
discipline = Discipline.create({name: "Batterie",
                               duree:"30", frequence: hebdo,
                               tarif1: 460, tarif2: 495, tarif3: 525,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Technique vocale Individuel",
                               duree:"60", frequence: bi,
                               tarif2: 535, tarif3: 565,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Technique vocale collectif",
                               duree:"120", frequence: bi,
                               tarif2: 220, tarif3: 220,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Formation musicale",
                               duree:"60", frequence: hebdo,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Supplément de cours",
                               duree:"15", frequence: hebdo,
                               tarif1: 200, tarif2: 200, tarif3: 200,
                               valide: true, fm: false})
discipline = Discipline.create({name: "Atelier",
                               duree:"60", frequence: aucun,
                               tarif1: 150, tarif2: 150, tarif3: 150,
                               valide: true, fm: false})
