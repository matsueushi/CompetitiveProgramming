function solve(n, as, bs, q, xs, ys)
    fs = zeros(Int, n)
    gs = zeros(Int, n)

    s = Set{Int}()
    j = 0
    for i in 1:n
        push!(s, as[i])
        while j + 1 ≤ n && bs[j+1] ∈ s
            j += 1
        end
        fs[i] = j
    end

    t = Set{Int}()
    i = 0
    for j in 1:n
        push!(t, bs[j])
        while i + 1 ≤ n && as[i+1] ∈ t
            i += 1
        end
        gs[j] = i
    end

    for k in 1:q
        i, j = xs[k], ys[k]
        if i ≤ gs[j] && j ≤ fs[i]
            println("Yes")
        else
            println("No")
        end
    end
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    bs = parse.(Int, split(readline()))
    q = parse(Int, readline())
    xs, ys = zeros(Int, q), zeros(Int, q)
    for i in 1:q
        xs[i], ys[i] = parse.(Int, split(readline()))
    end
    solve(n, as, bs, q, xs, ys)
end

main()
