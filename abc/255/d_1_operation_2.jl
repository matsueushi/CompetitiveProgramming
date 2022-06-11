parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, q, as, xs)
    sort!(as)
    cas = cumsum(as)
    asum = last(cas)
    res = zeros(Int, q)
    for i in 1:q
        x = xs[i]
        pos = searchsortedlast(as, x)
        if pos == 0
            res[i] = asum - n * x
            continue
        end
        under = cas[pos]
        ops = pos * x - under
        over = asum - under
        ops += over - (n - pos) * x
        res[i] = ops
    end
    res
end

function main()
    n, q = parseints()
    as = parseints()
    xs = zeros(Int, q)
    for i in 1:q
        xs[i] = parseint()
    end
    for x in solve(n, q, as, xs)
        println(x)
    end
end

main()
