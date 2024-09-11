Class {
	#name : 'ODWork',
	#superclass : 'ODPlace',
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'initialization' }
ODWork >> initialize [

	super initialize.
	probabilityToConvince := 10 "%"
]
