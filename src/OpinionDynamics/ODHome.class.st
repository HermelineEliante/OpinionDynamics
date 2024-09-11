Class {
	#name : 'ODHome',
	#superclass : 'ODPlace',
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'initialization' }
ODHome >> initialize [

	super initialize.
	probabilityToConvince := 0.
]
