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
#----
# @__{subslide()}__
#
# ### Surface plots
f(x, y) = exp(sqrt(x^2 + y^2))
xs = range(-1, 1, length = 20)
ys = range(-1, 1, length = 20)
surface(xs, ys, [f(x, y) for x in xs, y in ys], label = "Cosy surface")
#----
# @__{subslide()}__
#
# ### Quiver plots
x = (-2pi):0.2:(2 * pi)
y = sin.(x)
u = ones(length(x))
v = cos.(x)
plot(x, y, quiver = (u, v), arrow = true, xlims = (-7, 8), ylims = (-1.5, 1.5))
#----
# @__{subslide()}__
#
# ### Ribbons
aa = rand(10)
bb = rand(10)
cc = rand(10)
plot(collect(1:10), cc, ribbon = (bb, aa))
#----
# @__{subslide()}__
#
# ### Fill between functions
plot(sin, 0, 2pi)
plot!(cos, 0, 2pi, fillrange = (2, 1)) # numbers are the series indices
#----------------------------------------
# @__{slide()}__
#
# ## What's missing?
#
# - Layouting is a mess (especially setting margins)
# - [Meta-Issue](https://github.com/JuliaPlots/Plots.jl/issues/2290)
#----------------------------------------
# @__{slide()}__
#
# ## Lessons learned
#
# - might make sense to directly target pgf/TikZ if used as backend
#----------------------------------------
