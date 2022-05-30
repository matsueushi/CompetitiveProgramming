parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, xs)
    ys = sort(xs)
    pos = (n + 1) ÷ 2
    med = ys[pos]
    res = zeros(Int, n)
    if iseven(n)
        for i in 1:n
            res[i] = ifelse(xs[i] ≤ med, ys[pos+1], med)
        end
    else
        for i in 1:n
            res[i] = ifelse(xs[i] < med, med, ys[pos-1])
        end
    end
    res
end

function main()
    n = parseint()
    xs = parseints()
    for b in solve(n, xs)
        println(b)
    end
end

main()
