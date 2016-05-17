
find_package(CUDA 5.5 QUIET)

if(NOT CUDA_FOUND)
    return()
endif()

set(HAVE_CUDA TRUE)
message(STATUS "Found cuda_v${CUDA_VERSION}")
include_directories(SYSTEM ${CUDA_INCLUDE_DIRS})
list(APPEND SINGA_LINKER_LIBS ${CUDA_CUDART_LIBRARY} ${CUDA_curand_LIBRARY} ${CUDA_CUBLAS_LIBRARIES})

#if(USE_CUDNN)
#include(cmake/Modules/Cudnn.cmake)
    find_package(CUDNN REQUIRED)
    include_directories(SYSTEM ${CUDNN_INCLUDE_DIR})
    list(APPEND SINGA_LINKER_LIBS ${CUDNN_LIBRARIES})
    add_definitions(-DUSE_CUDNN)
#endif()

