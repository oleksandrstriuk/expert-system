/*Expert diagnosis system project. Attachment for laboratory work.
Petro Mohyla Black Sea State University, Mykolaiv 2019.*/

go:-
hypothesis(Disease),
write('I assume that you have '),
write(Disease),
nl,
write('Take care of yourself! '),
undo.

/*The hypothesis that needs be verified.*/

hypothesis(cold) :- cold, !.
hypothesis(flu) :- flu, !.
hypothesis(typhoid) :- typhoid, !.
hypothesis(measles) :- measles, !.
hypothesis(malaria) :- malaria, !.
hypothesis(unknown). /*Unknown disease.*/

/*Hypothesis identification rules.*/

cold :-
verify(headache),
verify(runny_nose),
verify(sneezing),
verify(sore_throat),
write('Suggestions and Advice:'),
nl,
write('1: Paracetamol/tab'),
nl,
write('2: Tilorone/tab'),
nl,
write('3: Nasal Spray'),
nl,
write('Please wear warm clothes because'),
nl.

flu :-
verify(fever),
verify(headache),
verify(chills),
verify(body_aches),
write('Suggestions and Advice:'),
nl,
write('1: Oseltamivir/tab'),
nl,
write('2: Paracetamol/tab'),
nl,
write('3: Zanamivir/tab'),
nl,
write('Please drink more fluids and gargle regularly because'),
nl.

typhoid :-
verify(headache),
verify(abdominal_pain),
verify(poor_appetite),
verify(fever),
write('Suggestions and Advice:'),
nl,
write('1: Chloramphenicol/tab'),
nl,
write('2: Amoxicillin/tab'),
nl,
write('3: Ciprofloxacin/tab'),
nl,
write('4: Azithromycin/tab'),
nl,
write('Please follow strict bed rest and keep a soft diet because'),
nl.

measles :-
verify(fever),
verify(runny_nose),
verify(rash),
verify(conjunctivitis),
write('Suggestions and Advice:'),
nl,
write('1: Paracetamol/tab'),
nl,
write('2: Naproxen/tab'),
nl,
write('3: Ibuprofen/tab'),
nl,
write('4: Vitamin A'),
nl,
write('Please get rest and drink more fluids because'),
nl.

malaria :-
verify(fever),
verify(hyperhidrosis),
verify(headache),
verify(nausea),
verify(vomiting),
verify(diarrhea),
write('Suggestions and Advice:'),
nl,
write('1: Chloroquine/tab'),
nl,
write('2: Quinine/tab'),
nl,
write('3: Hydroxychloroquine/tab'),
nl,
write('4: Mefloquine'),
nl,
write('Please do not sleep outdoors and cover your skin because'),
nl.

/*The format for asking questions.*/

ask(Question) :-
write('Does the patient have the following symptom:'),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/*How to verify?*/

verify(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))).

/*Undo all yes/no assertions.*/

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
