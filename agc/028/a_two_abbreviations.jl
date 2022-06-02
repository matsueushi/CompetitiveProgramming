parseints() = parse.(Int, split(readline()))

function solve(n, m, s, t)
    l = gcd(n, m)
    n0 = n ÷ l
    m0 = m ÷ l
    for i in 1:l
        j = n0 * (i - 1) + 1
        k = m0 * (i - 1) + 1
        s[j] != t[k] && return -1
    end
    lcm(n, m)
end

function main()
    n, m = parseints()
    s = readline()
    t = readline()
    println(solve(n, m, s, t))
end

main()
