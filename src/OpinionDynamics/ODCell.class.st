Class {
	#name : 'ODCell',
	#superclass : 'CMSpatialEntityElement',
	#instVars : [
		'place'
	],
	#category : 'OpinionDynamics',
	#package : 'OpinionDynamics'
}

{ #category : 'accessing' }
ODCell >> place [

	^ place
]

{ #category : 'accessing' }
ODCell >> place: anObject [

	place := anObject
]

{ #category : 'accessing' }
ODCell >> pov [ 
<pov>
| color |
	color := Color gray.
 place class = ODHome ifTrue: [ color := Color black ].
 place class = ODWork ifTrue: [ color := Color red ].
 place class = ODSocialPlace ifTrue: [ color := Color yellow ].

^ CMPointOfView color: color
]
