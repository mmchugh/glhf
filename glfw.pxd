cdef extern from "glfw/include/GLFW/glfw3.h":
    ctypedef struct GLFWwindow:
        pass

    ctypedef struct GLFWmonitor:
        pass

    int glfwInit()
    void glfwTerminate()

    GLFWwindow* glfwCreateWindow(int width, int height, const char* title, GLFWmonitor* monitor, GLFWwindow* share)
    int glfwWindowShouldClose(GLFWwindow* window);
    void glfwSwapBuffers(GLFWwindow* window)
    void glfwPollEvents()
    void glfwMakeContextCurrent(GLFWwindow* window)
    void glfwSwapInterval(int interval)
