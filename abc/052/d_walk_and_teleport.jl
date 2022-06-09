parseints() = parse.(Int, split(readline()))

function solve(n, a, b, xs)
    res = 0
    for i in 2:n
        res += min((xs[i] - xs[i-1]) * a, b)
    end
    res
end

function main()
    n, a, b = parseints()
    xs = parseints()
    println(solve(n, a, b, xs))
end

main()
