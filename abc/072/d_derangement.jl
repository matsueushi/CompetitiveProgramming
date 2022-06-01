parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, ps)
    res = 0
    for i in 1:n-1
        if ps[i] == i
            res += 1
            ps[i], ps[i+1] = ps[i+1], ps[i]
        end
    end
    if ps[n] == n
        res += 1
    end
    res
end

function main()
    n = parseint()
    ps = parseints()
    println(solve(n, ps))
end

main()
