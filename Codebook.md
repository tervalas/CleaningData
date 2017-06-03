# CODEBOOK #

## SUBJECT	1
>   ### Subject Number
>           1..30	.Subject identifier assigned within study

## Activity 6.18
>   ### Activity Type for test
>			LAYING				(subject was laying down)
>			SITTING				(subject was sitting)
>			STANDING			(subject was standing without moving)
>			WALKING 			(subject was walking on level surface)
>			WALKING_DOWNSTAIRS	(subject was walking down stairs)
>			WALKING_UPSTAIRS	(subject was walking up stairs)

## FEATURE	12..32
>	### General Format of Feature Measured
>			t - time domain
>			f - frequency domain
>			Acc - accelerometer data
>			Gyro - gyroscope data
>			Body - accelerometer body motion component
>			Gravity - accelerometer gravity component
>			Mean - Average value of collected data
>			Std - Standard deviation of collected data
>			Jerk - derived from linear acceleration and angular velocity data
>			Mag - Magnitude
>			angle - angle between vectors
>			X/Y/Z - vector direction of collected data

## RESULT	17..18
>	### Averaged Results of Collected Data for each feature by subject and activity
>			Based on normalized data results
>			Bounded within [-1,1]