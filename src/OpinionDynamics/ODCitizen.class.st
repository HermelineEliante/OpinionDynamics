Class {
	#name : 'ODCitizen',
	#superclass : 'ODAgent',
	#instVars : [
		'opinion',
		'count',
		'isSocial'
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

{ #category : 'control' }
ODCitizen >> initialize [

	super initialize.
	opinion := false.
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
