# GLHF

(Open)GL, Have Fun

The basic premise of this package is to make it really easy to get started with graphics programming in python.

An example:
```python
import glhf

glhf.open_window(500, 500, "Sample")

while glhf.running():
    glhf.clear()
    glhf.finish_frame()
```
