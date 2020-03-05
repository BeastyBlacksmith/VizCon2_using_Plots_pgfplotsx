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
#----
# @__{subslide()}__
#
# ### 3D contours
using Plots;
pgfplotsx();
f(x, y) = exp(-x^2 - y^2)
xs = range(-1, 1, length = 20)
ys = range(-1, 1, length = 20)
contour3d(xs, ys, [f(x, y) for x in xs, y in ys])
#----
# @__{subslide()}__
#
# ### Heatmaps
xs = [string("x", i) for i = 1:10]
ys = [string("y", i) for i = 1:4]
z = float((1:4) * reshape(1:10, 1, :))
pgfx_plot = heatmap(xs, ys, z, aspect_ratio = 1)
#----
# @__{subslide()}__
#
# ### 3D scatter
n = 100
ts = range(0, stop = 8π, length = n)
x = ts .* map(cos, ts)
y = (0.1ts) .* map(sin, ts)
z = 1:n
pl = plot(
        x,
        y,
        z,
        zcolor = reverse(z),
        m = (10, 0.8, :blues, Plots.stroke(0)),
        leg = false,
        cbar = true,
        w = 5,
)
pgfx_plot = plot!(pl, zeros(n), zeros(n), 1:n, w = 10)
#----------------------------------------
# @__{slide()}__
#
# ## What's missing?
#----------------------------------------
# @__{slide()}__
#
# ## Lessons learned
#----------------------------------------
