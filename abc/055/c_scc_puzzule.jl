parseints() = parse.(Int, split(readline()))

function main()
    n, m = parseints()
    res = 0
    x = min(n, m >> 1)
    res += x
    n -= x
    m -= x << 1
    if n == 0
        res += m >> 2
    end
    println(res)
end

main()
