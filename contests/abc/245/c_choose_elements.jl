function solve(n, k, xs, ys)
    vs = Set([xs[1], ys[1]])
    for i in 2:n
        nextvs = Set{Int64}()
        for z in [xs[i], ys[i]]
            for v in vs
                if abs(z - v) ≤ k
                    push!(nextvs, z)
                end
            end
        end
        isempty(nextvs) && return false
        vs = nextvs
    end
    true
end

function main()
    n, k = parse.(Int64, split(readline()))
    xs = parse.(Int64, split(readline()))
    ys = parse.(Int64, split(readline()))
    println(solve(n, k, xs, ys) ? "Yes" : "No")
end

main()
