Class {
	#name : 'OpinionDynamics',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'citizens',
		'politicians',
		'cells',
		'home',
		'work',
		'socialPlace',
		'hourOfDay',
		'stepWhenEveryoneGotConvinced'
	],
	#classInstVars : [
		'intialSizeCitizens',
		'intialSizePoliticians'
	],
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'initialization' }
OpinionDynamics class >> initializeParameters [

super initializeParameters .
intialSizeCitizens := 10.
intialSizePoliticians := 3
	
]

{ #category : 'accessing' }
OpinionDynamics class >> intialSizeCitizens [

	^ intialSizeCitizens
]

{ #category : 'accessing' }
OpinionDynamics class >> intialSizeCitizens: anObject [

	intialSizeCitizens := anObject
]

{ #category : 'accessing' }
OpinionDynamics class >> intialSizePoliticians [

	^ intialSizePoliticians
]

{ #category : 'accessing' }
OpinionDynamics class >> intialSizePoliticians: anObject [

	intialSizePoliticians := anObject
]

{ #category : 'accessing' }
OpinionDynamics >> allAgents [

	<getterFor: #ODAgent >
	^ citizens, politicians 
]

{ #category : 'accessing' }
OpinionDynamics >> cells [

	<getterFor: #ODCell>
	^ cells
]

{ #category : 'accessing' }
OpinionDynamics >> citizens [
	<getterFor: #ODCitizen>
	^ citizens
]

{ #category : 'initialize-release' }
OpinionDynamics >> createHome [
	"set the home"

	| targetCells |
	targetCells := self
		               selectCellsBetweenLine1: 2
		               line2: 8
		               andColumn1: 2
		               column2: 8.
		
	targetCells do: [ :c | c place: home ].
	home cells: targetCells.

	self allAgents do: [ :agent | agent home: home ]
]

{ #category : 'initialize-release' }
OpinionDynamics >> createSocialPlace [
	"set the social place"

	| targetCells |
	targetCells := self
		               selectCellsBetweenLine1: 21
		               line2: 28
		               andColumn1: 8
		               column2: 16.

	targetCells do: [ :c | c place: socialPlace ].
	socialPlace cells: targetCells.
	
	self allAgents do: [ :agent | agent socialPlace: socialPlace ]
]

{ #category : 'initialize-release' }
OpinionDynamics >> createWork [
	"set the work"

	| targetCells |
	targetCells := self
		               selectCellsBetweenLine1: 2
		               line2: 8
		               andColumn1: 20
		               column2: 28.

	targetCells do: [ :c | c place: work ].
	work cells: targetCells.
	
	self allAgents do: [ :agent | agent work: work ]
]

{ #category : 'initialize-release' }
OpinionDynamics >> init [

	<init>
	hourOfDay := 0.

	self
		createGridNumberOfRows: 30
		numberOfColumns: 30
		neighbourhood: 8
		closed: true.

	home := ODHome new.
	work := ODWork new.
	socialPlace := ODSocialPlace new.

	self createN: (self class intialSizeCitizens )randomlyLocatedEntities: ODCitizen.
	self createN: (self class intialSizePoliticians )randomlyLocatedEntities: ODPolitician.
	self allAgents do: [ :ag |
		ag randomNumberGenerator: randomNumberGenerator ].
	self citizens do: [ :ag | ag setSociality ].
	"set the home"
	self createHome.
	"set the work"
	self createWork.
	"set the resto"
	self createSocialPlace.

	self allAgents do: #goHome
]

{ #category : 'initialization' }
OpinionDynamics >> initialize [

	super initialize.
	politicians := OrderedCollection new.
	citizens := OrderedCollection new.
	cells := OrderedCollection new.
	
	stepWhenEveryoneGotConvinced := 1
]

{ #category : 'testing' }
OpinionDynamics >> isEveryoneConvinced [

	^ citizens allSatisfy: #isConvinced
]

{ #category : 'probes' }
OpinionDynamics >> numberOfConvinced [

	<probeNamed: 'Number of beConvinced' color: 'EBE0C7'>
	^ (self citizens select: #isConvinced) size
]

{ #category : 'stepping' }
OpinionDynamics >> oneHourStep [
	"interaction process for the politicals"

	<control>
	self isEveryoneConvinced ifFalse: [
		stepWhenEveryoneGotConvinced := stepWhenEveryoneGotConvinced + 1 ].
	
	hourOfDay := hourOfDay + 1 \\ 24.

	(hourOfDay between: 7 and: 12)
		ifTrue: [ "self halt." self allAgents do: #goWork ]
		ifFalse: [
			(hourOfDay between: 12 and: 14)
				ifTrue: [ self allAgents do: #goSocialPlace ]
				ifFalse: [
					(hourOfDay between: 14 and: 17)
						ifTrue: [ self allAgents do: #goWork ]
						ifFalse: [
							(hourOfDay between: 17 and: 21)
								ifTrue: [ self allAgents do: #goSocialPlace ]
								ifFalse: [ self allAgents do: #goHome ] ] ] ].


	politicians do: #interactionProcess
]

{ #category : 'accessing' }
OpinionDynamics >> politicians [
	<getterFor: #ODPolitician>
	^ politicians
]

{ #category : 'probes' }
OpinionDynamics >> proportionOfConvinced [
	"retourne la proportion de citizen convaincus, c'est à dire le nombre de citizen convaincus divisé par la population totale de citizen. Si il n'y a pas de citizen, la réponse est 0"

	<probeNamed: 'proportion of beConvinced' color: 'FF0000'>
	self citizens size = 0 ifTrue: [ ^ 0 ].

	^ (self citizens select: #isConvinced) size / self citizens size
	  * 100
]

{ #category : 'stepping' }
OpinionDynamics >> step [
	"daily step of 24 oneHourSteps"

	<control>
	hourOfDay := (hourOfDay + 1) \\ 24.
]

{ #category : 'probes' }
OpinionDynamics >> stepsToConvinceEveryone [

	<probeNamed: 'Steps to convince everyone' color: '2980B9'>
	^ stepWhenEveryoneGotConvinced
]
