parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, a1, a2)
    res = 0
    for i in 1:n
        res = max(res, sum(a1[1:i]) + sum(a2[i:end]))
    end
    res
end

function main()
    n = parseint()
    a1 = parseints()
    a2 = parseints()
    println(solve(n, a1, a2))
end

main()
