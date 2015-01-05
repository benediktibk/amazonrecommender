# Challenge
[http://2015.recsyschallenge.com/challenge.html](http://2015.recsyschallenge.com/challenge.html)
# Stats
##tiny.mat
`Name           Size             Bytes  Class     Attributes

 rankings      99x253             8144  double    sparse`

###useAdvancedSimiliarityMeasurement = 0;
`Averaged results after5 runs:
Precision:0.48948
Recall:0.28597
Evaluation Score:10.0527`
###useAdvancedSimiliarityMeasurement = 1;
`Averaged results after5 runs:
Precision:0.76511
Recall:0.28253
Evaluation Score:12.0978`

##test.mat
`Name             Size                 Bytes  Class     Attributes

 rankings      2528x2888            58406912  double`   
###useAdvancedSimiliarityMeasurement = 0;
`Averaged results after5 runs:
Precision:0.99959
Recall:0.82865
Evaluation Score:151.3485`
###useAdvancedSimiliarityMeasurement = 1;
`Averaged results after5 runs:
Precision:0.99953
Recall:0.82716
Evaluation Score:150.1648`

##small.mat
`Name             Size                 Bytes  Class     Attributes

 rankings      254619x20843      42456190536  double`   
###useAdvancedSimiliarityMeasurement = 0;
`Averaged results after5 runs:
Precision:0.995125
Recall:0.990745
Evaluation Score:Out of memory`


Details:
`Fold #1
Precision:0.99999
Recall:0.99123
Evaluation Score:Out of memory
building model cache
reduce similarity cache
Elapsed time is 145.983984 seconds.
 
Fold #2
estimate rankings
Elapsed time is 54.337113 seconds.
check accuracy

Precision:1
Recall:0.99026
Evaluation Score:Out of memory
building model cache
reduce similarity cache
Elapsed time is 153.917894 seconds.`
