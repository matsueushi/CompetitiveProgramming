parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

const M = 2 * 10^5

function solve(n, ls, rs)
    xs = zeros(Int, M + 1)
    for i in 1:n
        xs[ls[i]] += 1
        xs[rs[i]] -= 1
    end
    ys = cumsum(xs)
    ind = 1

    xres = Int[]
    yres = Int[]
    while ind ≤ M
        if ys[ind] > 0
            push!(xres, ind)
            while ind != M && ys[ind+1] > 0
                ind += 1
            end
            push!(yres, ind + 1)
        end
        ind += 1
    end
    xres, yres
end

function main()
    n = parseint()
    ls, rs = parsepoints(n)
    xres, yres = solve(n, ls, rs)
    for (x, y) in zip(xres, yres)
        println("$x $y")
    end
end

main()
