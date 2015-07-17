cdef extern from "glew/include/GL/glew.h":
    ctypedef unsigned int GLenum;

    GLenum glewInit()
