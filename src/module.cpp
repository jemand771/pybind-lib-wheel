#include <pybind11/pybind11.h>
#include "mylib.h"
#include "yourlib.h"

namespace py = pybind11;

PYBIND11_MODULE(mymod, m, py::mod_gil_not_used()) {
    m.doc() = "documentation baby";
    m.def("add", &veryComplexOperation);
    m.def("mul", &evenMoreComplexOperation);
}
