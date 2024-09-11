Class {
	#name : 'ODCitizen',
	#superclass : 'ODAgent',
	#instVars : [
		'opinion',
		'count'
	],
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'control' }
ODCitizen >> beConvinced [

	opinion := true
]

{ #category : 'control' }
ODCitizen >> initialize [

	super initialize.
	opinion := false
]

{ #category : 'accessing' }
ODCitizen >> pov [

	<pov>

	^ CMPointOfView
		color: CMColor red
		shape: (opinion ifTrue: [ #star ] ifFalse: [ #circle ] )
]
