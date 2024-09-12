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
"The probability of a citizen changing opinion depends on their confidence and previous interactions (≥ 3)."
	aCitizen beConvinced
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
