Class {
	#name : 'ODSocialPlace',
	#superclass : 'ODPlace',
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'initialization' }
ODSocialPlace >> initialize [

	super initialize.
	probabilityToConvince := 25 "%"
]
