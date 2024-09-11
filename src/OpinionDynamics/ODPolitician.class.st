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

{ #category : 'testing' }
ODPolitician >> isAtHome [

	^ self currentPlace = ODHome 
]

{ #category : 'testing' }
ODPolitician >> isAtSocialPlace [

	^ self currentPlace = ODSocialPlace 
]

{ #category : 'testing' }
ODPolitician >> isAtWork [
	^self currentPlace = ODWork 
]

{ #category : 'accessing' }
ODPolitician >> pov [

	<pov>
	^ CMPointOfView color: CMColor blue
]
