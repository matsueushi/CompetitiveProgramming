using Printf

parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, m, ps, ys)
    ds = NTuple{3,Int}[]
    for i in 1:m
        push!(ds, (ps[i], ys[i], i))
    end
    sort!(ds)

    res = Vector{String}(undef, m)
    cp = -1
    ind = 0
    for i in 1:m
        p, _, j = ds[i]
        if p != cp
            cp = p
            ind = 0
        end
        ind += 1
        res[j] = @sprintf "%06i%06i" p ind
    end
    res
end

function main()
    n, m = parseints()
    ps, ys = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        ps[i], ys[i] = parseints()
    end
    for s in solve(n, m, ps, ys)
        println(s)
    end
end

main()
