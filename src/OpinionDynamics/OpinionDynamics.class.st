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
		'hourOfDay'
	],
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

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

	self createN: 10 randomlyLocatedEntities: ODCitizen.
	self createN: 3 randomlyLocatedEntities: ODPolitician.
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
]

{ #category : 'stepping' }
OpinionDynamics >> oneHourStep [
	"interaction process for the politicals"

	<control>
	hourOfDay := hourOfDay + 1 \\ 24.
	politicians do: #interactionProcess.
	
	(hourOfDay between: 7 and: 12)
		ifTrue: [ self allAgents do: #goWork ]
		ifFalse: [ self allAgents do: #goHome ]
]

{ #category : 'accessing' }
OpinionDynamics >> politicians [
	<getterFor: #ODPolitician>
	^ politicians
]

{ #category : 'stepping' }
OpinionDynamics >> step [
	"daily step of 24 oneHourSteps"

	<control>
	hourOfDay := (hourOfDay + 1) \\ 24.
]
