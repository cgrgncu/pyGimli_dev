# 2D ERT modelling and inversion

```
import matplotlib.pyplot as plt
import numpy as np

import pygimli as pg
import pygimli.meshtools as mt
from pygimli.physics import ert
```


### 建立模型世界(模型的幾何描述、邊界條件)
+ Create geometry definition for the modelling domain. worldMarker=True indicates the default boundary conditions for the ERT
```
world = mt.createWorld(start=[-50, 0], end=[50, -50], layers=[-1, -5], worldMarker=True)
```
```
pg.show(geom)
```
