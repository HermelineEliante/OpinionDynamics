Class {
	#name : 'ODPlace',
	#superclass : 'Object',
	#instVars : [
		'probabilityToConvince',
		'cells'
	],
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'accessing' }
ODPlace >> cells [

	^ cells
]

{ #category : 'accessing' }
ODPlace >> cells: anObject [

	cells := anObject
]

{ #category : 'initialization' }
ODPlace >> initialize [

	super initialize.
	cells := OrderedCollection new
]

{ #category : 'accessing' }
ODPlace >> probabilityToConvince [

	^ probabilityToConvince
]

{ #category : 'accessing' }
ODPlace >> probabilityToConvince: anObject [

	probabilityToConvince := anObject
]
