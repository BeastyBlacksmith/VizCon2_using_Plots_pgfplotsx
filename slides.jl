#----------------------------------------
# @__{slide()}__
# @__{theme("simple")}__
# @__{header("""<h1 style="margin-left:20ex;>pgfplotsx()</h1>""")}__
#
#
# The Plots pgfplotsx-backend
# =====
#----------------------------------------
# @__{slide()}__
#
# ## Why?
#
# - Missing features
# - (Hopefully) easier to maintain
#----------------------------------------
# @__{slide()}__
#
# ## What's new?
#----------------------------------------
# @__{slide()}__
#
# ### 3D contours
using Plots;
pgfplotsx();
f(x, y) = exp(-x^2 - y^2)
xs = range(-1, 1, length = 20)
ys = range(-1, 1, length = 20)
contour3d(xs, ys, [f(x, y) for x in xs, y in ys])
#----------------------------------------
# @__{slide()}__
#
# ## What's missing?
#----------------------------------------
# @__{slide()}__
#
# ## Lessons learned
#----------------------------------------
