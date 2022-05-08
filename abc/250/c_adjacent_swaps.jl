function solve(n, q, xs)
    vs = collect(1:n)
    pos = collect(1:n)
    for i in 1:q
        p = pos[xs[i]]
        if p == n
            p -= 1
        end
        pos[vs[p]], pos[vs[p+1]] = p + 1, p
        vs[p], vs[p+1] = vs[p+1], vs[p]
    end
    vs
end

function main()
    n, q = parse.(Int, split(readline()))
    xs = zeros(Int, q)
    for i in 1:q
        xs[i] = parse(Int, readline())
    end
    println(join(solve(n, q, xs), " "))
end

main()
