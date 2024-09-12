Class {
	#name : 'ODPolitician',
	#superclass : 'ODAgent',
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'control' }
ODPolitician >> chooseCitizen [
	"pick randomly one agent from all Agents of my current zone"

	self isAtWork ifTrue: [
		^ self selectRandomlyFrom: self allCitizenFromWork ].
	self isAtSocialPlace ifTrue: [
		^ self selectRandomlyFrom: self allCitizenFromSocialPlace ].
	self isAtHome ifTrue: [
		^ self selectRandomlyFrom: self allCitizenFromHome ].
	^ nil
]

{ #category : 'as yet unclassified' }
ODPolitician >> convince: aCitizen [
	"ODPolitician convince a Citizen"

	| probability |
	"la probabilité est définie en fonction du lieu où se trouve le citoyen"
	probability := aCitizen place class
		               caseOf: {
				               ([ ODHome ] -> [ 0 ]).
				               ([ ODWork ] -> [ 0.10 ]).
				               ([ ODSocialPlace ] -> [ 0.25 ]) }
		               otherwise: [ ^ 0 ].

	"Incrémenter le nombre d'interactions"
	aCitizen incrementNumberOfInteractions .

	"Si le citoyen a eu au moins 3 interactions et que la probabilité est favorable, il est convaincu"
	(aCitizen numberOfInteractions >= 3 and: [ Random new next < probability ]) ifTrue: [
		aCitizen beConvinced ]
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

{ #category : 'accessing' }
ODPolitician >> pov [

	<pov>
	^ CMPointOfView color: CMColor blue
]
