using Plots

function f(t)
    tp = rem.(t, 9)
    y1 = 2 * sin.(2*pi/9 * tp)
    y2 = 1
    y3 = -1

    y4 = min.(y2, y1)
    y = max.(y4, y3)

    return y
end

plot(0:0.01:18, f(0:0.01:18), lw=2, xaxis=0:1:18)