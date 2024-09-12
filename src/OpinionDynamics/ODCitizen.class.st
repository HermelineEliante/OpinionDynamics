Class {
	#name : 'ODCitizen',
	#superclass : 'ODAgent',
	#instVars : [
		'opinion',
		'count',
		'isSocial',
		'place'
	],
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'control' }
ODCitizen >> beConvinced [

	opinion := true
]

{ #category : 'control' }
ODCitizen >> goSocialPlace [
	isSocial ifTrue: [ super goSocialPlace ]
]

{ #category : 'as yet unclassified' }
ODCitizen >> incrementNumberOfInteractions [

	count := count + 1
]

{ #category : 'control' }
ODCitizen >> initialize [

	super initialize.
	opinion := false.
	count := 0
	"isSocial := self random > 0.5"
]

{ #category : 'testing' }
ODCitizen >> isConvinced [

	^ opinion
]

{ #category : 'accessing' }
ODCitizen >> isSocial [

	^ isSocial
]

{ #category : 'accessing' }
ODCitizen >> isSocial: anObject [

	isSocial := anObject
]

{ #category : 'as yet unclassified' }
ODCitizen >> numberOfInteractions [

	^count 

]

{ #category : 'accessing' }
ODCitizen >> pov [

	<pov>

	^ CMPointOfView
		color: CMColor red
		shape: (opinion ifTrue: [ #star ] ifFalse: [ #circle ] )
]

{ #category : 'control' }
ODCitizen >> setSociality [

	isSocial := self random > 0.5
]
