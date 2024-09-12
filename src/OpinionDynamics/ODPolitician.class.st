Class {
	#name : 'ODPolitician',
	#superclass : 'ODAgent',
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'control' }
ODPolitician >> chooseCitizen [
	"pick randomly one agent from all Agents of my current zone"

	(self isAtWork and: [ work hasCitizens ]) ifTrue: [
		^ self selectRandomlyFrom: self allCitizenFromWork ].
	(self isAtSocialPlace and: [ socialPlace hasCitizens ]) ifTrue: [
		^ self selectRandomlyFrom: self allCitizenFromSocialPlace ].
	(self isAtHome and: [ home hasCitizens ]) ifTrue: [
		^ self selectRandomlyFrom: self allCitizenFromHome ].
	^ nil
]

{ #category : 'control' }
ODPolitician >> convince: aCitizen [
	"ODPolitician try to convince a Citizen"

	| probability |
	aCitizen isConvinced ifTrue: [ ^self ].
	"la probabilité est définie en fonction du lieu où se trouve le citoyen"
	"probability := aCitizen place class
		               caseOf: {
				               ([ ODHome ] -> [ 0 ]).
				               ([ ODWork ] -> [ 0.10 ]).
				               ([ ODSocialPlace ] -> [ 0.25 ]) }
		               otherwise: [ ^ 0 ]."
probability := aCitizen place probabilityToConvince / 100.
	"Incrémenter le nombre d'interactions"
	aCitizen incrementNumberOfInteractions.

	"Si le citoyen a eu au moins 3 interactions et que la probabilité est favorable, il est convaincu"
	(aCitizen numberOfInteractions >= 3 and: [
		 "Random new next"self random < probability ]) ifTrue: [ aCitizen beConvinced ]
]

{ #category : 'control' }
ODPolitician >> currentPlace [
"return the type of my current place"
	^self patch place class

]

{ #category : 'control' }
ODPolitician >> interactionProcess [

	| anAgent |
	anAgent := self chooseCitizen.
	anAgent ifNil: [ ^self ].
	self convince: anAgent
]

{ #category : 'testing' }
ODPolitician >> isPolitician [

	^ true
]

{ #category : 'accessing' }
ODPolitician >> pov [

	<pov>
	^ CMPointOfView color: CMColor blue
]
