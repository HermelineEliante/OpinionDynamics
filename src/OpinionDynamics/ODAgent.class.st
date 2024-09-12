Class {
	#name : 'ODAgent',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'home',
		'work',
		'socialPlace'
	],
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'control' }
ODAgent >> allAgentsFromHome [
	"returns a collection of agents situated at work"

	
	^ self allAgentsFromZone: 'home'
]

{ #category : 'control' }
ODAgent >> allAgentsFromSocialPlace [
	"returns a collection of agents situated at work"

	
	^ self allAgentsFromZone: 'socialPlace'
]

{ #category : 'control' }
ODAgent >> allAgentsFromWork [
	"returns a collection of agents situated at work"

	"    ^ self allAgentsFromZone: 'work'   "
	| listOfAgents |
	listOfAgents := OrderedCollection new.
	self work cells do: [ : cell | listOfAgents addAll: cell allOccupants ].
	listOfAgents remove: self ifAbsent: [ nil ].
	^ listOfAgents
]

{ #category : 'control' }
ODAgent >> allAgentsFromZone: aPlaceString [

	| listOfAgents place |
	listOfAgents := OrderedCollection new.
	place := self perform: aPlaceString asSymbol.
	listOfAgents addAll: (place cells flatCollect: #allOccupants).
	listOfAgents remove: self ifAbsent: [ nil ].
	^ listOfAgents
]

{ #category : 'control' }
ODAgent >> allCitizenFromHome [
	^self allAgentsFromHome select: [ :ag| ag class = ODCitizen ]
]

{ #category : 'control' }
ODAgent >> allCitizenFromSocialPlace [

	^ self allAgentsFromSocialPlace select: [ :ag |
		  ag class = ODCitizen ]
]

{ #category : 'control' }
ODAgent >> allCitizenFromWork [

	^ self allAgentsFromWork select: [ :ag | ag class = ODCitizen ]
]

{ #category : 'control' }
ODAgent >> goHome [

	self moveTo: (self selectRandomlyFrom: home cells)
]

{ #category : 'control' }
ODAgent >> goSocialPlace [

	self moveTo: (self selectRandomlyFrom: socialPlace cells)
]

{ #category : 'control' }
ODAgent >> goWork [

	self moveTo: (self selectRandomlyFrom: work cells)
]

{ #category : 'accessing' }
ODAgent >> home [

	^ home
]

{ #category : 'accessing' }
ODAgent >> home: anObject [

	home := anObject
]

{ #category : 'testing' }
ODAgent >> isAtHome [

	^ self currentPlace = ODHome 
]

{ #category : 'testing' }
ODAgent >> isAtSocialPlace [

	^ self currentPlace = ODSocialPlace 
]

{ #category : 'testing' }
ODAgent >> isAtWork [
	^self currentPlace = ODWork 
]

{ #category : 'testing' }
ODAgent >> isCitizen [

	^ false
]

{ #category : 'testing' }
ODAgent >> isPolitician [

	^ false
]

{ #category : 'accessing' }
ODAgent >> place [

	^ { work . home . socialPlace }
		detect: [ :place | place cells includes: self patch ]
		ifNone: [ nil ]
]

{ #category : 'accessing' }
ODAgent >> socialPlace [

	^ socialPlace
]

{ #category : 'accessing' }
ODAgent >> socialPlace: anObject [

	socialPlace := anObject
]

{ #category : 'accessing' }
ODAgent >> work [

	^ work
]

{ #category : 'accessing' }
ODAgent >> work: anObject [

	work := anObject
]
