#include <vector>
#include <tuple>
#include <string>
#include <mutex>
#include <limits>

struct Point {
    const std::vector<float> coords;
    int cluster {};
    float min_distance {};

    Point(const std::vector<float>& coords);
    void printPointInfo() const;
};


class kMeans {
    public:
        kMeans();
        kMeans(int k, const std::string& name);
        kMeans(int k, const std::vector<std::vector<float>>& data);
        void ClusterData();
        void threadedClustering();
        void printClusteredData();

        std::tuple<int, float> getMinDistanceAndIndex(const std::vector<float>& coord, const std::vector<std::vector<float>>& all_means);

        float getDistance(const std::vector<float>& coord, const std::vector<float>& mean);

        void update_means(std::vector< std::vector<float> >& all_means, const std::vector<int>& assigned_clusters);

        void cluster(std::vector<std::vector<float>> all_means);

        void assignClusters();

        std::vector<float> split(const std::string& a, char delimiter);

        std::vector< std::vector<float> > getMeans();

        std::vector<int> getMins();

        std::vector<int> getMaxs();

        int clusters; 
        std::vector<Point> data; 
        std::vector<std::vector<float>> last_means;
        std::vector<std::vector<float>> start_state;
        float total_edge_distance = std::numeric_limits<float>::infinity();
        std::mutex _mutex;
};