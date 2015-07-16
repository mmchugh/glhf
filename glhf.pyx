cdef extern from "glfw/include/GLFW/glfw3.h":
    cpdef int glfwInit()
    cpdef void glfwTerminate()
