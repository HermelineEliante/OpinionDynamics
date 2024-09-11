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

{ #category : 'accessing' }
ODCitizen >> pov [

	<pov>
	^ CMPointOfView color: CMColor red
]
