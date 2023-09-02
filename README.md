# **kMeans Algorithm** 
![](https://img.shields.io/badge/C%2B%2B-00599C?style=for-the-badge&logo=c%2B%2B&logoColor=white)




## **Background**
A ```kNeans``` is an algorithm that clusters a dataset into a fixed number of clusters based on some distance metrics.  
Every cluster has its ```centroid```, and all datapoints that are near to a centroid are assigned that cluster.

## **File Structure**
 ```diff
      build
      cc_api
          code
            include
              + kMeans.h
            src
              + kMeans.cc
            + CMakeLists.txt
          tests
            + kNNTests.cc
            + CMakeLists.txt
          + main.cpp
          + CMakeLists.txt
      extern
        pybind11
      + CMakeLists.txt
      + main.cpp
 ```

There is library kMeans under the ```cc_api/``` folder. This has the ```file.txt``` that I used for testing, and also the ```kMeans*.so``` file which is the shared python object that ```pybind11``` creates.   

```diff
Importing this shared object means importing the kMeans Library.
```

If you decide to use it, make sure to build the root ```CMakeLists.txt``` again, and add more interfaces to the ```kMeans``` class under cc_api. 

The ```interfaces``` are under the root ```main.cpp``` file. 

