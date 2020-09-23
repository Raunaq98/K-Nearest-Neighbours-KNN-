# K - Nearest Neighbors (KNN)

K nearest neighbors is a simple **classification algorithm** that stores all available cases and classifies new cases based on a similarity measure.
the output is a class membership. An object is **classified by a plurality vote of its neighbors**, with the object being assigned to 
the class most common among its k nearest neighbors (k is a positive integer, typically small). 
If k = 1, then the object is simply assigned to the class of that single nearest neighbor.

For a given **K**, the closest neighbours of the test data are considered with count = k. The majority class of these K neighbours
is then given to the test data.
These neighbours are found based on their distance from the data point.
The distance can be :

    - Euclidian , Manhattan , Minkowski (continous variables)
    - Hamming (categorical variables)
    
