cdef extern from "glew/include/GL/glew.h":
    ctypedef unsigned int GLenum;
    ctypedef unsigned int GLenum;
    ctypedef unsigned int GLbitfield;
    ctypedef unsigned int GLuint;
    ctypedef int GLint;
    ctypedef int GLsizei;
    ctypedef unsigned char GLboolean;
    ctypedef signed char GLbyte;
    ctypedef short GLshort;
    ctypedef unsigned char GLubyte;
    ctypedef unsigned short GLushort;
    ctypedef unsigned long GLulong;
    ctypedef float GLfloat;
    ctypedef float GLclampf;
    ctypedef double GLdouble;
    ctypedef double GLclampd;
    ctypedef void GLvoid;

    GLenum glewInit()
    void glClear (GLbitfield mask);
    void glClearColor (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
