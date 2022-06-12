parseints() = parse.(Int, split(readline()))

function solve(n, k)
    m = n ÷ k
    res = m^3
    isodd(k) && return res
    m2 = n ÷ (k >> 1)
    x = (m2 + 1) >> 1
    res += x^3
    res
end

function main()
    n, k = parseints()
    println(solve(n, k))
end

main()
