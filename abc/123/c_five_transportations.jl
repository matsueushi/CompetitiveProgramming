parseint() = parse(Int, readline())

function solve(n, a, b, c, d, e)
    f = minimum([a, b, c, d, e])
    cld(n, f) + 4
end

function main()
    n = parseint()
    a = parseint()
    b = parseint()
    c = parseint()
    d = parseint()
    e = parseint()
    println(solve(n, a, b, c, d, e))
end

main()
