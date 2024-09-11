Class {
	#name : 'OpinionDynamics',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'citizens',
		'politicians',
		'cells'
	],
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

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
OpinionDynamics >> init [

	<init>
	self 
		createGridNumberOfRows: 30
		numberOfColumns: 30
		neighbourhood: 8
		closed: true.
	
	self createN: 10 randomlyLocatedEntities: ODCitizen.
	self createN: 3 randomlyLocatedEntities: ODPolitician
]

{ #category : 'initialization' }
OpinionDynamics >> initialize [

	super initialize.
	politicians := OrderedCollection new.
	citizens := OrderedCollection new.
	cells := OrderedCollection new
]

{ #category : 'accessing' }
OpinionDynamics >> politicians [
	<getterFor: #ODPolitician>
	^ politicians
]

{ #category : 'stepping' }
OpinionDynamics >> step [

	<control>
	
]
