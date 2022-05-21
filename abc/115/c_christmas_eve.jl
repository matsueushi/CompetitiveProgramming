parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, k, hs)
    sort!(hs)
    res = typemax(Int)
    for i in 1:n-k+1
        res = min(res, hs[i+k-1] - hs[i])
    end
    res
end

function main()
    n, k = parseints()
    hs = zeros(Int, n)
    for i in 1:n
        hs[i] = parseint()
    end
    println(solve(n, k, hs))
end

main()
