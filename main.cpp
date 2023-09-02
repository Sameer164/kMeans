#include <pybind11/pybind11.h>
#include <kMeans.h>
#include <pybind11/stl.h>
#include <string>

namespace py = pybind11;


std::vector<std::vector<float>> GetStartState(kMeans& k){
    k.threadedClustering();
    return k.start_state;
}

void PrintFinalState(kMeans& k) {
    k.threadedClustering();
    k.printClusteredData();
}


PYBIND11_MODULE(kMeansPyExport, handle) {
    handle.def("GetStartState", &GetStartState);
    handle.def(
        "PrintFinalState", &PrintFinalState
    );
    py::class_<kMeans>(handle, "kMeansClass")
    .def(py::init<int, std::string>());
}