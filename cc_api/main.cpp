#include <kMeans.h>
#include <string>

int main() {
    kMeans k {3, "file.txt"};
    k.ClusterData();
    k.threadedClustering();
    k.printClusteredData();
    return 0;
}
