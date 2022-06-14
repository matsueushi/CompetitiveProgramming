parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

const L = 100

function solve(n, xs, ys, hs)
    for cx in 0:100
        for cy in 0:100
            heights = Set{Int}()
            limits = Set{Int}()
            for (x, y, h) in zip(xs, ys, hs)
                h0 = abs(x - cx) + abs(y - cy)
                if h != 0
                    push!(heights, h + h0)
                else
                    push!(limits, h0)
                end
            end
            if length(heights) == 1
                hc = only(heights)
                all(hc .≤ limits) && return (cx, cy, hc)
            end
        end
    end
end

function main()
    n = parseint()
    xs, ys, hs = zeros(Int, n), zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i], hs[i] = parseints()
    end
    join(solve(n, xs, ys, hs), " ") |> println
end

main()
