parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, m, as, bs)
    mid = Set{Int}()
    for i in 1:m
        as[i] == 1 && (push!(mid, bs[i]))
    end
    for i in 1:m
        (bs[i] == n && as[i] ∈ mid) && return true
    end
    false
end

function main()
    n, m = parseints()
    as, bs = parsepoints(m)
    println(ifelse(solve(n, m, as, bs), "POSSIBLE", "IMPOSSIBLE"))
end

main()
