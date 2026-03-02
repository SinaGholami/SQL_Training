# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning
I think this approach is better space wise! If our boats has limited space its better to distribute data evenly between them. Also if anything happens to on of the boats atleast not all data from a time frame will be lost! So it is more reliable in this way.

## Partitioning by Hour
I believe this is the fastest way. you just need to know which boat you should look and then you have all the data you need. But it has some downsides, first it is prone to lose all data of a time frame if one of our boats get in to trouble and also we need to adjust storage of our boats since probably one is going to need way more than the other.
## Partitioning by Hash Value
This is the middle way in my point of view. We have the advantages of both methods above. Although we are not as fast as second one or as small storage as first one but it is a good solution to follow if we want both speed and space!
